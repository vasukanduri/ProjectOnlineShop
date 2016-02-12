using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using MobileShop.BusinessLayer;
using System.Data;

namespace MobileShop.Admin
{
    public partial class AddProducts : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                LoadCategories();
             
                if (Request.QueryString["alert"] == "success")
                {
                    Response.Write("<script>alert('Record saved succesfully');</script>");
                }
            }
        }
        //private void AddSubmitEvent()
        //{
        //    UpdatePanel updatepanel = Page.Master.FindControl("AdminUpdatePanel1") as UpdatePanel;
        //    UpdatePanelControlTrigger trigger = new PostBackTrigger();
        //    trigger.ControlID = btnProductSubmit.UniqueID;
        //    updatepanel.Triggers.Add(trigger);
        //}
        private void LoadCategories()
        {
            ShoppingCart k = new ShoppingCart();
            DataTable dt = k.GetCategories();
            if (dt.Rows.Count > 0)
            {
                ddlCategory.DataValueField = "CategoryID";
                ddlCategory.DataTextField = "CategoryName";
                ddlCategory.DataSource = dt;
                ddlCategory.DataBind();
            }


        }

        protected void btnProductSubmit_Click(object sender, EventArgs e)
        {
            if (UploadProductImage.PostedFile != null)
            {
                SaveProductImage();
                ShoppingCart k = new ShoppingCart()
                {
                    ProductName = tbProductName.Text,
                    ProductImage = "~/ProductImages/" + UploadProductImage.FileName,
                    ProductPrice = tbProductPrice.Text,
                    ProductDescription = tbProductDescription.Text,
                    CategoryId = Convert.ToInt32(ddlCategory.SelectedValue),
                    TotalProducts = Convert.ToInt32(tbProductQuantity.Text)
                };
                k.AddNewProduct();
                ClearText();
                Response.Redirect("~/Admin/AddProducts.aspx?alert=success");
            }
            else
            {
                Response.Write("<script>alert('Please upload image');</script>");
            }
        }
        private void ClearText()
        {
            tbProductName.Text = string.Empty;
            tbProductDescription.Text = string.Empty;
            tbProductPrice.Text = string.Empty;

        }
        private void SaveProductImage()
        {
            if (UploadProductImage.PostedFile != null)
            {
                string filename = UploadProductImage.PostedFile.FileName.ToString();
                string fileext = System.IO.Path.GetExtension(UploadProductImage.FileName);

                if (fileext != ".jpeg" && fileext != ".jpg" && fileext != ".png" && fileext != ".bmp")
                {
                    Response.Write("<script>alert('invalid format');</script>");
                }
                else if (filename.Length > 96)
                {
                    Response.Write("<script>alert('large size');</script>");
                }
                else if (UploadProductImage.PostedFile.ContentLength > 4000000)
                {
                    Response.Write("<script>alert('size should not be more than 4MB');</script>");
                }
                else
                {
                    UploadProductImage.SaveAs(Server.MapPath("~/ProductImages/" )+ filename);
                }
            }
        }
    }
}