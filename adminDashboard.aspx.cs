using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using System.Web.UI.WebControls;

namespace wapp
{
    public partial class adminDashboard : System.Web.UI.Page
    {
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["mycon"].ToString());
        SqlDataAdapter adapt;
        DataTable dt;
        DataTable dt2;
        DataTable dt3;
        protected void Page_Load(object sender, EventArgs e)
        {
            if ((Session["user_id"] != null) && (Session["user_role"].ToString() == "Admin"))
            {
                if (!IsPostBack)
                {
                   
                }
            }
            else
            {
                Response.Redirect("~/home.aspx");
            }
        }
    }
}