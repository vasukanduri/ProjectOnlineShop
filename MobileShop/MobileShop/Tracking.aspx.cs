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
    public partial class Tracking : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                LoadTransactions();

            }
        }
        public void LoadTransactions()
        {
            Transaction ts = new Transaction();
            DataTable dt = ts.GetAllTransactions();
            if (dt.Rows.Count > 0)
            {
                ddlTransID.DataTextField = "TransactionNo";
                ddlTransID.DataValueField = "TransactionNo";
                ddlTransID.DataSource = dt;
                ddlTransID.DataBind();
            }

        }
        protected void ddlTransID_SelectedIndexChanged(object sender, EventArgs e)
        {

            int TransId = int.Parse(ddlTransID.SelectedValue);
            LoadCustomerData(TransId);
            LoadTransactionData(TransId);

        }
        public void LoadCustomerData(int TransID)
        {
            Transaction ts = new Transaction()
            {
                TransactionId = TransID
            };
            rptrCustomer.DataSource = null;
            rptrCustomer.DataSource = ts.LoadCustData();
            rptrCustomer.DataBind();

        }
        public void LoadTransactionData(int TransactionID)
        {
            Transaction ts = new Transaction()
            {
                TransactionId = TransactionID
            };
            gvTransactionItems.DataSource = null;
            gvTransactionItems.DataSource = ts.GetTransactionInfo();
            gvTransactionItems.DataBind();
        }
        protected void ddlTransID_TextChanged(object sender, EventArgs e)
        {
            int TransId = int.Parse(ddlTransID.SelectedValue);
            LoadCustomerData(TransId);
            LoadTransactionData(TransId);
        }

        protected void ddlTransID_SelectedIndexChanged1(object sender, EventArgs e)
        {
            int TransId = int.Parse(ddlTransID.SelectedValue);
            LoadCustomerData(TransId);
            LoadTransactionData(TransId);
        }
    }
}