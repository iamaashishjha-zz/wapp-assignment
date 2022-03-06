using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;

namespace wapp
{
    public partial class notes : System.Web.UI.Page
    {
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["mycon"].ToString());

        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["user_id"] != null)
            {
                if (!IsPostBack)
                {
                    BindRepeator();
                }

            }
            else
            {
                Response.Redirect("~/login-auth.aspx");

            }
        }

        private void BindRepeator()
        {
            string CS = ConfigurationManager.ConnectionStrings["mycon"].ConnectionString;
            using (SqlConnection con = new SqlConnection(CS))
            {
                
                SqlCommand cmd = new SqlCommand("getCourseNotes", con);
                cmd.CommandType = CommandType.StoredProcedure;
                con.Open();
                Repeater1.DataSource = cmd.ExecuteReader();
                Repeater1.DataBind();
            }
        }
    }
}