using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.Configuration;

namespace MobileShop.Admin
{
    public partial class Login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            tbAdminID.Focus();
        }

        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            string LoginId = WebConfigurationManager.AppSettings["AdminLoginID"];
            string Password = WebConfigurationManager.AppSettings["AdminPassword"];
            if (tbAdminID.Text == LoginId && tbPassword.Text == Password)
            {
                Session["OnlineShopAdmin"] = "OnlineShopAdmin";
                Response.Redirect("~/Admin/AddProducts.aspx");
            }
            else
            {
                lblAlert.Text = "Invalid LoginId/Password";
            }
        }
    }
}