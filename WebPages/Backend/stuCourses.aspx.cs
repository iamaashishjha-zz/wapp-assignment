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
    public partial class stuCourses : System.Web.UI.Page
    {
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["mycon"].ToString());

        protected void Page_Load(object sender, EventArgs e)
        {
            if ((Session["user_id"] != null) && ((Session["user_sub_role"].ToString() == "Student")))
            {
                if (!IsPostBack)
                {
                    BindRepeator();
                }
                //BindRepeator();

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
                string query = "SELECT course.id as courseId,course.name as courseName FROM tblStudentCourse as data LEFT JOIN tblCourses as course ON course.id = data.course_id WHERE data.user_id = '" + user_id + "'";
                SqlCommand cmd = new SqlCommand(query, con);
                con.Open();
                Repeater1.DataSource = cmd.ExecuteReader();
                Repeater1.DataBind();
            }
        }

        protected void btnRemoveCourse_Click(object sender, EventArgs e)
        {
            string course_id = ((Label)Repeater1.Items[0].FindControl("lblCourseId")).Text;
            int user_id = (int)Session["user_id"];
            //string query = "DELETE FROM tblStudentCourse WHERE user_id ='"+user_id+"',course_id ='"+course_id+"'";
            string qry = "DELETE FROM tblStudentCourse WHERE user_id ='"+user_id+"' AND course_id ='"+course_id+"'";

            con.Open();
            SqlCommand cmd = new SqlCommand(qry, con);
            cmd.ExecuteNonQuery();
            con.Close();

            DataTable dt = new DataTable();
            Repeater1.DataSource = dt;
            Repeater1.DataBind();
            //Response.Write(course_id);
            //Response.Write(user_id);
            //Response.Redirect("~/home.aspx");
        }
    }
}