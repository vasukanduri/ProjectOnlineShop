using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using MobileShop.BusinessLayer;
using System.Data;

namespace MobileShop
{
    public partial class CheckOutPage : System.Web.UI.Page
    {
        List<int> lstMyCart;
        DataTable dtCart;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                lstMyCart = (List<int>)Session["CartItems[]"];
                LoadMyCart();
            }
            
        }
        private void LoadMyCart()
        {
            ShoppingCart k = new ShoppingCart();
            pnlMyCart.Visible = true;
            //pnlCheckOut.Visible = true;       

            if (lstMyCart.Count == 0)
            {
                Response.Write("<script>alert('There are no items in the cart');</script>");
            }
            else
            {
                dtCart = k.GetProductsWithProductId(lstMyCart);
                dlCart.DataSource = dtCart;
                dlCart.DataBind();
                tbTotalProducts.Text = dlCart.Items.Count.ToString();
            }
        }


        protected void tbProductQuantity_TextChanged(object sender, EventArgs e)
        {
            TextBox tb = (TextBox)sender;
            DataListItem item = (DataListItem)tb.NamingContainer;
            Label L1 = (Label)item.FindControl("lblAvailableStock");
            Label lblError = (Label)item.FindControl("lblMsgStock");
            if (int.Parse(tb.Text) > int.Parse(L1.Text))
            {
                lblError.Text = "Your required no of items is more than available please enter lesser amount";
            }
            else if (tb.Text == "0" || tb.Text == null)
            {
                tb.Text = "1";
            }
            
            tbTotalPrice.Text = "0";
            for (int i = 0; i < dlCart.Items.Count; i++)
            {
                DataListItem li = dlCart.Items[i];
                TextBox txtCost = (TextBox)li.FindControl("tbProductQuantity");
                Label lPrice = (Label)li.FindControl("lblPrice");
                tbTotalPrice.Text = (int.Parse(tbTotalPrice.Text) + ((int.Parse(txtCost.Text)) * (int.Parse(lPrice.Text)))).ToString();
            }
        }
        protected void dlCart_ItemDataBound(object sender, DataListItemEventArgs e)
        {
            Label lCost = e.Item.FindControl("lblPrice") as Label;
            TextBox tbQuantity = e.Item.FindControl("tbProductQuantity") as TextBox;
            if (tbTotalPrice.Text == "")
            {
                tbTotalPrice.Text = "0";
            }
            try
            {
                tbTotalPrice.Text = (int.Parse(tbTotalPrice.Text) + ((int.Parse(tbQuantity.Text)) * (int.Parse(lCost.Text)))).ToString();

            }
            catch { }

        }

        protected void btnRemoveFromCart_Click(object sender, EventArgs e)
        {
            int id = Convert.ToInt16((((Button)sender).CommandArgument));
            List<int> lst = (List<int>)Session["CartItems[]"];
            foreach (int i in lst)
            {
                if (i == id)
                {
                    lst.Remove(i);
                    break;
                }
            }
            Session["CartItems"] = lst;
            ShoppingCart k = new ShoppingCart();
            dtCart = k.GetProductsWithProductId(lst);
            dlCart.DataSource = dtCart;
            dlCart.DataBind();
            tbTotalProducts.Text = dlCart.Items.Count.ToString();
        }

        protected void btnPlaceOrder_Click(object sender, EventArgs e)
        {
            Transaction ts = new Transaction();
            try
            {
                ts.CustName = tbCustomerName.Text;
                ts.CustPhone = int.Parse(tbCustomerPhone.Text);
                ts.Email = tbCustomerEmail.Text;
                ts.Address = tbCustomerAddress.Text;
                ts.NoOfProducts = int.Parse(tbTotalProducts.Text);
                ts.TotalCost = int.Parse(tbTotalPrice.Text);
                ts.TransactionId = ts.AddNewTransaction();
            }
            catch { }
            for (int i = 0; i < dlCart.Items.Count; i++)
            {
                try
                {
                    DataListItem lst = dlCart.Items[i];
                    HiddenField hd = (HiddenField)lst.FindControl("hfProductID");
                    Label lblName = (Label)lst.FindControl("lblProductName");
                    TextBox tbNo = (TextBox)lst.FindControl("tbProductQuantity");
                    ts.ProductID = int.Parse(hd.Value);
                    ts.ProductName = lblName.Text;
                    ts.NoOfItems = int.Parse(tbNo.Text);
                    ts.SaveTransactionDetails();
                }
                catch
                {

                }
            }
            int transID = ts.TransactionId;
            OrderPlacedSuccessFully(transID);
        }
        private void OrderPlacedSuccessFully(int TransactionID)
        {

            tbCustomerAddress.Text = "";
            tbCustomerEmail.Text = "";
            tbCustomerName.Text = "";
            tbCustomerPhone.Text = "";
            tbTotalPrice.Text = "";
            tbTotalProducts.Text = "";                 
            pnlMyCart.Visible = false;
            pnlCustomerDetails.Visible = false;
            pnlOrderPlacedSuccessfully.Visible = true;
            lblTransactionNo.Text = TransactionID.ToString();
            lstMyCart = null;
            Session["CartItems[]"] = null;
            LinkButton lb = (LinkButton)this.Master.FindControl("lbtnCartItems");
        }

        protected void btnChkOut_Click(object sender, EventArgs e)
        {
            pnlMyCart.Visible = false;
            pnlCustomerDetails.Visible = true;
        }

        
    }
}
