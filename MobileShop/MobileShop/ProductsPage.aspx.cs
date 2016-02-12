using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using MobileShop.BusinessLayer;
using System.Data;
using System.IO;

namespace MobileShop
{
    public partial class ProductsPage : System.Web.UI.Page
    {
      
        public static List<int> lstCartItems;
        DataTable dtCart;        
        protected void Page_Load(object sender, EventArgs e)
        {               
       
            if (!IsPostBack)
            {
                //Page last = (Page)sender;
                //LinkButton li = new LinkButton();
                //li = (LinkButton)last.FindControl("lbtnCategories");
                //int id = int.Parse(li.CommandArgument);
                int CategoryId = int.Parse(Session["CategoryID"].ToString());
                GetProducts(CategoryId);
                lstCartItems = new List<int>();
            }
            else
            {
                if (Session["CartItems[]"]!=null)
                lstCartItems = (List<int>)Session["CartItems[]"];
            }
        }
        private void GetProducts(int CategoryID)
        {
            ShoppingCart k = new ShoppingCart()
            {
                CategoryId = CategoryID
            };

            dlProducts.DataSource = null;
            dlProducts.DataSource = k.GetAllProducts();
            dlProducts.DataBind();

        }
        protected void dlProducts_ItemDataBound(object sender, DataListItemEventArgs e)
        {
           
            Label Label1 = e.Item.FindControl("lblStock") as Label;
            Label lblError = e.Item.FindControl("lblMsg") as Label;
            if (Label1.Text == "0")
            {
                lblError.Text = "This Product is not available currently";
                Button btn = e.Item.FindControl("btnAddToCart") as Button;
                btn.Enabled = false;
            }

        }

        protected void btnAddToCart_Click(object sender, EventArgs e)
        {
            int ProductID = Convert.ToInt32((((Button)sender).CommandArgument));
            lstCartItems.Add(ProductID);
            LinkButton li = new LinkButton();
            li = (LinkButton)this.Master.FindControl("lbtnCartItems");
            Session["CartItems[]"] = lstCartItems;
            li.Text = lstCartItems.Count().ToString();

        }

        protected void LinkButton1_Click(object sender, EventArgs e)
        {
            ShoppingCart k = new ShoppingCart();
            int ProductID = Convert.ToInt32((((LinkButton)sender).CommandArgument));
            DataTable dt= k.GetProductDetails(ProductID);
            dlProductDetails.DataSource = dt;
            dlProductDetails.DataBind();            
            pnlProducts.Visible = false;
            pnlDetails.Visible = true;
        }

        protected void dlProductDetails_ItemDataBound(object sender, DataListItemEventArgs e)
        {

        }

        protected void btnAddToCart2_Click(object sender, EventArgs e)
        {
            int ProductID = Convert.ToInt32((((Button)sender).CommandArgument));
            lstCartItems.Add(ProductID);
            LinkButton li = new LinkButton();
            li = (LinkButton)this.Master.FindControl("lbtnCartItems");
            li.Text = lstCartItems.Count().ToString();
            Session["CartItems[]"] = lstCartItems;
        }
        
    }
}