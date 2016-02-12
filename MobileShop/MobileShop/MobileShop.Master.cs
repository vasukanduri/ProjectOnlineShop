using System;
using MobileShop.BusinessLayer;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Collections.Generic;
using System.Linq;

namespace MobileShop
{
    public partial class MobileShop : System.Web.UI.MasterPage
    {
        
        protected void Page_Load(object sender, EventArgs e)
        {
            if(Session["CartItems[]"]!=null)
            {

                int x = ((List<int>)Session["CartItems[]"]).Count;
                lbtnCartItems.Text = x.ToString();
            }
            else
            {
                lbtnCartItems.Text = "0";
            }
            if (!IsPostBack)
            {
               // lbtnCartItems.Text = "0";
                GetCategory();               

            }
            else
            {
                List<int> lstCartItems = (List<int>)Session["CartItems[]"];
              if (lstCartItems != null)
                {
                    lbtnCartItems.Text = lstCartItems.Count.ToString();

                }
            }            
           
        }
       
        private void GetCategory()
        {

            ShoppingCart k = new ShoppingCart();           
            dlCategories.DataSource = k.GetCategories();
            dlCategories.DataBind();
        }

        protected void lbtnCategories_Click(object sender, EventArgs e)
        {
            //LinkButton lb = new LinkButton();
            //int i = int.Parse(lb.CommandArgument);
            Session["CategoryID"] = Convert.ToInt32((((LinkButton)sender).CommandArgument));
            Response.Redirect("ProductsPage.aspx");
        }

        protected void lbtnCartItems_Click(object sender, EventArgs e)
        {
            Response.Redirect("CheckOutPage.aspx");
        }
    }
}