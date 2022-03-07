using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;

namespace wapp.WebPages.Frontend
{
    public partial class home : System.Web.UI.Page
    {
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

        protected void btnLogout_Click(object sender, EventArgs e)
        {
            Session.Remove("user_id");
            Session.Remove("user_email");
            Response.Redirect("~/index.aspx");
        }

        protected void btnDashboard_Click(object sender, EventArgs e)
        {
            if((Session["user_role"].ToString() == "Admin") && (Session["user_sub_role"].ToString() == "Admin"))
            {
                Response.Redirect("~/adminDashboard.aspx");
            }

            else if(Session["user_role"].ToString() == "User") {
                if(Session["user_sub_role"].ToString() == "Teacher")
                {
                    Response.Redirect("~/teachDashboard.aspx");

                } else if (Session["user_sub_role"].ToString() == "Student")
                {
                    Response.Redirect("~/stuDashboard.aspx");
                }
                else
                {
                    Response.Redirect("~/home.aspx");
                }
            }
            else
            {
                Response.Redirect("~/home.aspx");
            }
        }

        private void BindRepeator()
        {
            string CS = ConfigurationManager.ConnectionStrings["mycon"].ConnectionString;
            using (SqlConnection con = new SqlConnection(CS))
            {
                SqlCommand cmd = new SqlCommand("getCoursesDetails", con);
                cmd.CommandType = CommandType.StoredProcedure;
                con.Open();
                Repeater1.DataSource = cmd.ExecuteReader();
                Repeater1.DataBind();
            }
        }
    }
}