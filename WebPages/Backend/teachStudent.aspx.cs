using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using System.Globalization;
using System.Web.UI.WebControls;

namespace wapp.WebPages.Backend
{
    public partial class teachStudent : System.Web.UI.Page
    {
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["mycon"].ToString());

        protected void Page_Load(object sender, EventArgs e)
        {
            if ((Session["user_id"] != null) && ((Session["user_role"].ToString() == "Admin") || (Session["user_sub_role"].ToString() == "Teacher")))
            {
                if (!IsPostBack)
                {
                    BindRepeator();
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
            //SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["mycon"].ToString());
            using (SqlConnection con = new SqlConnection(CS))
            {
                int user_id = (int)Session["user_id"];

                string query = "SELECT AVG(data.course_id),COUNT(data.user_id) as userCount,course.name as courseName FROM tblCourses as course LEFT JOIN tblStudentCourse as data ON course.id = data.course_id WHERE course.user_id = '" + user_id+ "' GROUP BY course.name";
                SqlCommand cmd = new SqlCommand(query, con);
                //cmd.CommandType = CommandType.StoredProcedure;
                con.Open();
                Repeater1.DataSource = cmd.ExecuteReader();
                Repeater1.DataBind();
            }
        }
    }
}