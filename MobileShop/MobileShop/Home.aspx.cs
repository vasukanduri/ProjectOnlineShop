using System;
using MobileShop.BusinessLayer;
using System.Data;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace MobileShop
{
    public partial class Home : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {

                //GetCategory();              
                Session.Abandon();

            }
        }

        protected void ibLeft_Click(object sender, ImageClickEventArgs e)
        {
            string url = Image3.ImageUrl;
            Image3.ImageUrl = Image1.ImageUrl;
            Image2.ImageUrl = Image1.ImageUrl;
            Image1.ImageUrl = url;
        }

        protected void ibRight_Click(object sender, ImageClickEventArgs e)
        {

            string url = Image1.ImageUrl;
            Image1.ImageUrl = Image2.ImageUrl;
            Image2.ImageUrl = Image3.ImageUrl;
            Image3.ImageUrl = url;
        }

        protected void lft_Click(object sender, ImageClickEventArgs e)
        {
            string url = img7.ImageUrl;
            img7.ImageUrl = img6.ImageUrl;
            img2.ImageUrl = img1.ImageUrl;
            img3.ImageUrl = img2.ImageUrl;
            img4.ImageUrl = img3.ImageUrl;
            img5.ImageUrl = img4.ImageUrl;
            img6.ImageUrl = img5.ImageUrl;
            img1.ImageUrl = url;
        }

        protected void rgt_Click(object sender, ImageClickEventArgs e)
        {
            string url = img1.ImageUrl;
            img1.ImageUrl = img2.ImageUrl;
            img2.ImageUrl = img3.ImageUrl;
            img3.ImageUrl = img4.ImageUrl;
            img4.ImageUrl = img5.ImageUrl;
            img5.ImageUrl = img6.ImageUrl;
            img6.ImageUrl = img7.ImageUrl;
            img7.ImageUrl = url;





        }
    }
}