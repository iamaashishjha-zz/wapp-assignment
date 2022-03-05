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
    public partial class course : System.Web.UI.Page
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

        protected void btnLogout_Click(object sender, EventArgs e)
        {
            Session.Remove("user_id");
            Session.Remove("user_email");
            Response.Redirect("~/index.aspx");
        }

        protected void btnDashboard_Click(object sender, EventArgs e)
        {
            if ((Session["user_role"].ToString() == "Admin") && (Session["user_sub_role"].ToString() == "Admin"))
            {
                Response.Redirect("~/adminDashboard.aspx");
            }

            else if (Session["user_role"].ToString() == "User")
            {
                if (Session["user_sub_role"].ToString() == "Teacher")
                {
                    Response.Redirect("~/teachDashboard.aspx");

                }
                else if (Session["user_sub_role"].ToString() == "Student")
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

        protected void btnBuyCourse_Click(object sender, EventArgs e)
        {

            int user_id = (int)Session["user_id"];
            DateTime date = DateTime.Now;
            string course_id = ((Label)Repeater1.Items[0].FindControl("lblCourseId")).Text;


            string query = "INSERT INTO tblStudentCourse VALUES(@user_id, @course_id, @created_at)";
            SqlCommand cmd = new SqlCommand(query);
            cmd.Parameters.AddWithValue("@user_id", user_id);
            cmd.Parameters.AddWithValue("@course_id", course_id);
            cmd.Parameters.AddWithValue("@created_at", date);
            cmd.Connection = con;
            con.Open();
            cmd.ExecuteNonQuery();
            con.Close();
            Response.Redirect("~/home.aspx");

        }
    }
}