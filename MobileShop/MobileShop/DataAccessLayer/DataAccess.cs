using System.Web.Configuration;
using System.Data.SqlClient;
using System.Data;


namespace MobileShop.DataAccessLayer
{
    public class DataAccess
    {
        public static string ConnectionString
        {
            get
            {
                return WebConfigurationManager.ConnectionStrings["dbConnOnlineShopping"].ConnectionString.ToString();
            }
        }
        public static SqlParameter AddParameter(string paramName, object value, SqlDbType dbType, int size)
        {
            SqlParameter param = new SqlParameter();
            param.ParameterName = paramName;
            param.Value = value.ToString();
            param.SqlDbType = dbType;
            param.Size = size;
            param.Direction = ParameterDirection.Input;
            return param;
        }
        public static DataTable ExecuteDTByProcedure(string ProcedureName, SqlParameter[] Params)
        {
            SqlConnection conn = new SqlConnection(ConnectionString);
            SqlCommand cmd = new SqlCommand();
            cmd.Connection = conn;
            cmd.CommandText = ProcedureName;
            cmd.Parameters.AddRange(Params);
            cmd.CommandType = CommandType.StoredProcedure;
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            try
            {
                da.Fill(dt);

            }
            catch
            {

            }
            finally
            {
                da.Dispose();
                conn.Dispose();
                cmd.Parameters.Clear();
                cmd.Dispose();

            }

            return dt;
        }
    }
}