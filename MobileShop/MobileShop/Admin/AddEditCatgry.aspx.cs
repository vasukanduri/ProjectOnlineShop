using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using MobileShop.BusinessLayer;

namespace MobileShop.Admin
{
    public partial class AddEditCatgry : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnSubmitCategory_Click(object sender, EventArgs e)
        {
            ShoppingCart k = new ShoppingCart
            {
                CategoryName = tbCategoryName.Text
            };
            k.AddNewCategory();
            tbCategoryName.Text = string.Empty;
            Response.Redirect("~/Admin/AddProducts.aspx");
        }
    }
}