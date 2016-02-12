using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;

namespace MobileShop.BusinessLayer
{
    public class ShoppingCart
    {
        public string CategoryName;
        public int CategoryId;

        public string ProductName;
        public string ProductImage;
        public string ProductPrice;
        public string ProductDescription;

        public string CustomerName;
        public string CustomerEmail;
        public string CustomerPhone;
        public string CustomerAddress;
        public string ProductList;
        public string PaymentMethod;

        public string OrderStatus;
        public string OrderNo;

        public int TotalProducts;
        public int TotalPrice;
        public int StockType;
        public int Flag;
        public void AddNewCategory()
        {
            SqlParameter[] param = new SqlParameter[1];
            param[0] = DataAccessLayer.DataAccess.AddParameter("@CategoryName", CategoryName, System.Data.SqlDbType.VarChar, 150);
            DataTable dt = DataAccessLayer.DataAccess.ExecuteDTByProcedure("AddNewCategory", param);

        }

        public void AddNewProduct()
        {
            SqlParameter[] parameters = new SqlParameter[6];
            parameters[0] = DataAccessLayer.DataAccess.AddParameter("@ProductName", ProductName, SqlDbType.VarChar, 300);
            parameters[1] = DataAccessLayer.DataAccess.AddParameter("@ProductDescription", ProductDescription, SqlDbType.NVarChar, 1000);
            parameters[2] = DataAccessLayer.DataAccess.AddParameter("@ProductPrice", ProductPrice, SqlDbType.VarChar, 50);
            parameters[3] = DataAccessLayer.DataAccess.AddParameter("@ProductImage", ProductImage, SqlDbType.VarChar, 500);
            parameters[4] = DataAccessLayer.DataAccess.AddParameter("@CategoryID", CategoryId, SqlDbType.Int, 32);
            parameters[5] = DataAccessLayer.DataAccess.AddParameter("@ProductQuantity", TotalProducts, SqlDbType.Int, 100);

            DataTable dt = DataAccessLayer.DataAccess.ExecuteDTByProcedure("SP_AddNewProduct", parameters);
        }

        public DataTable GetAllProducts()
        {
            SqlParameter[] parameters = new SqlParameter[1];
            parameters[0] = DataAccessLayer.DataAccess.AddParameter("@CategoryID", CategoryId, System.Data.SqlDbType.Int, 20);
            DataTable dt = DataAccessLayer.DataAccess.ExecuteDTByProcedure("SP_GetAllProducts", parameters);
            return dt;
        }

        public DataTable GetCategories()
        {
            SqlParameter[] parameters = new SqlParameter[0];
            DataTable dt = DataAccessLayer.DataAccess.ExecuteDTByProcedure("SP_GetAllCategories", parameters);
            return dt;
        }
        public DataTable GetProductDetails(int ProductID)
        {
            SqlParameter[] param = new SqlParameter[1];
            param[0] = DataAccessLayer.DataAccess.AddParameter("@ProductID", ProductID, System.Data.SqlDbType.Int, 32);
            DataTable dt = DataAccessLayer.DataAccess.ExecuteDTByProcedure("SP_GetCartProduct", param);
            return dt;
        }
        public DataTable GetProductsWithProductId(List<int> ProductID)
        {
            DataTable dt=new DataTable();
            if (ProductID.Count > 0)
            {
                List<DataRow> lstRow = new List<DataRow>();
                DataTable dt1 = new DataTable();              
                foreach (int i in ProductID)
                {
                    SqlParameter[] parameters = new SqlParameter[1];
                    parameters[0] = DataAccessLayer.DataAccess.AddParameter("@ProductID", i, System.Data.SqlDbType.Int, 20);
                    dt1 = DataAccessLayer.DataAccess.ExecuteDTByProcedure("SP_GetCartProduct", parameters);
                    DataRow dr;
                    dr = dt1.Rows[0];
                    lstRow.Add(dr);
                }
                dt = lstRow.CopyToDataTable();               
            }
            return dt;

        }
    }
    public class Transaction
    {
        public int TransactionId;
        public int ProductID;
        public string ProductName;
        public int NoOfItems;

        public string CustName;
        public long CustPhone;
        public string Email;
        public string Address;
        public int NoOfProducts;
        public int TotalCost;


        public int AddNewTransaction()
        {
            SqlParameter[] parameters = new SqlParameter[7];
            parameters[0] = DataAccessLayer.DataAccess.AddParameter("@CustName", CustName, SqlDbType.NVarChar, 50);
            parameters[1] = DataAccessLayer.DataAccess.AddParameter("@CustPhone", CustPhone, SqlDbType.NChar, 10);
            parameters[2] = DataAccessLayer.DataAccess.AddParameter("@CustEmail", Email, SqlDbType.NChar, 10);
            parameters[3] = DataAccessLayer.DataAccess.AddParameter("@CustAddress", Address, SqlDbType.NVarChar, 50);
            parameters[4] = DataAccessLayer.DataAccess.AddParameter("@TotalProducts", NoOfProducts, SqlDbType.NChar, 50);
            parameters[5] = DataAccessLayer.DataAccess.AddParameter("@TotalPrice", TotalCost, SqlDbType.NChar, 50);
            parameters[6] = DataAccessLayer.DataAccess.AddParameter("@TransId", TransactionId, SqlDbType.Int, 50);

            DataTable dt = DataAccessLayer.DataAccess.ExecuteDTByProcedure("SP_AddTransaction", parameters);
            TransactionId = int.Parse(dt.Rows[0]["Column1"].ToString());
            return TransactionId;
        }
        public void SaveTransactionDetails()
        {
            SqlParameter[] parameters = new SqlParameter[4];
            parameters[0] = DataAccessLayer.DataAccess.AddParameter("@ProductID", ProductID, SqlDbType.Int, 50);
            parameters[1] = DataAccessLayer.DataAccess.AddParameter("@ProductName", ProductName, SqlDbType.NVarChar, 50);
            parameters[2] = DataAccessLayer.DataAccess.AddParameter("@TotalItems", NoOfItems, SqlDbType.Int, 10);
            parameters[3] = DataAccessLayer.DataAccess.AddParameter("@TransactionNo", TransactionId, SqlDbType.Int, 50);

            DataTable dt = DataAccessLayer.DataAccess.ExecuteDTByProcedure("SP_SaveTransaction", parameters);
        }

        public DataTable GetAllTransactions()
        {
            SqlParameter[] parameters = new SqlParameter[0];
            DataTable dt = DataAccessLayer.DataAccess.ExecuteDTByProcedure("SP_GetAllTransactions", parameters);
            return dt;
        }
        public DataTable LoadCustData()
        {
            SqlParameter[] parameters = new SqlParameter[1];
            parameters[0] = DataAccessLayer.DataAccess.AddParameter("@TransID", TransactionId, System.Data.SqlDbType.Int, 20);
            DataTable dt = DataAccessLayer.DataAccess.ExecuteDTByProcedure("SP_GetCustomerByTransactionID", parameters);
            return dt;
        }
        public DataTable GetTransactionInfo()
        {
            SqlParameter[] parameters = new SqlParameter[1];
            parameters[0] = DataAccessLayer.DataAccess.AddParameter("@TransID", TransactionId, System.Data.SqlDbType.Int, 20);
            DataTable dt = DataAccessLayer.DataAccess.ExecuteDTByProcedure("SP_GetTrasactionItemsInfo", parameters);
            return dt;

        }
    }
}