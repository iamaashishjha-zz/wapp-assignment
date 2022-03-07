using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using System.Web.UI.WebControls;

namespace wapp.WebPages.Backend
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
                    shwUsersGrid();
                    shwCourseGrid();
                    shwFeedbackGrid();
                    BindRepeator();
                }
            }
            else
            {
                Response.Redirect("~/home.aspx");
            }
        }

        protected void shwUsersGrid()
        {
            dt = new DataTable();
            SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["mycon"].ToString());

            con.Open();
            adapt = new SqlDataAdapter("Select Id,name,email,address,role,sub_role from tblUsers", con);
            adapt.Fill(dt);
            if (dt.Rows.Count > 0)
            {
                grdUsers.DataSource = dt;
                grdUsers.DataBind();
            }
            con.Close();
        }

        protected void grdUsers_RowEditing(object sender, System.Web.UI.WebControls.GridViewEditEventArgs e)
        {
            //NewEditIndex property used to determine the index of the row being edited.  
            grdUsers.EditIndex = e.NewEditIndex;
            shwUsersGrid();
        }
        protected void grdUsers_RowUpdating(object sender, System.Web.UI.WebControls.GridViewUpdateEventArgs e)
        {
            //Finding the controls from Gridview for the row which is going to update  
            Label id = grdUsers.Rows[e.RowIndex].FindControl("lbl_ID") as Label;
            TextBox name = grdUsers.Rows[e.RowIndex].FindControl("txtName") as TextBox;
            TextBox email = grdUsers.Rows[e.RowIndex].FindControl("txtEmail") as TextBox;
            TextBox address = grdUsers.Rows[e.RowIndex].FindControl("txtAddress") as TextBox;
            TextBox role = grdUsers.Rows[e.RowIndex].FindControl("txtRole") as TextBox;
            //TextBox sub_role = GridView1.Rows[e.RowIndex].FindControl("txtSubRole") as TextBox;
            DropDownList ddList = (DropDownList)grdUsers.Rows[e.RowIndex].FindControl("slctSubRole");
            SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["mycon"].ToString());

            con.Open();
            //updating the record  
            SqlCommand cmd = new SqlCommand("Update tblUsers set name='" + name.Text + "',email='" + email.Text + "',address='" + address.Text + "',sub_role='" + ddList.SelectedValue + "' where ID=" + Convert.ToInt32(id.Text), con);
            cmd.ExecuteNonQuery();
            con.Close();
            //Setting the EditIndex property to -1 to cancel the Edit mode in Gridview  
            grdUsers.EditIndex = -1;
            //Call ShowData method for displaying updated data  
            shwUsersGrid();
        }
        protected void grdUsers_RowCancelingEdit(object sender, System.Web.UI.WebControls.GridViewCancelEditEventArgs e)
        {
            //Setting the EditIndex property to -1 to cancel the Edit mode in Gridview  
            grdUsers.EditIndex = -1;
            shwUsersGrid();
        }

        protected void grdUsers_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {

            GridViewRow row = (GridViewRow)grdUsers.Rows[e.RowIndex];
            Label lbldeleteid = (Label)row.FindControl("Id");
            int id = Convert.ToInt32(grdUsers.DataKeys[e.RowIndex].Value.ToString());
            con.Open();
            SqlCommand cmd = new SqlCommand("DELETE FROM tblUsers WHERE id = '" + id + "'", con);
            cmd.ExecuteNonQuery();
            con.Close();
            shwUsersGrid();
        }

        protected void btnAddUser_Click(object sender, EventArgs e)
        {
            dt = new DataTable();
            SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["mycon"].ToString());
            string name = txtName.Text;
            string email = txtEmail.Text;
            string address = txtAddress.Text;
            string password = txtPassword.Text;
            string role = "User";
            string sub_role = slctSubRole1.SelectedValue;
            string query = "INSERT INTO tblUsers VALUES(@name, @email, @address, @password, @role, @sub_role)";
            SqlCommand cmd = new SqlCommand(query);
            cmd.Parameters.AddWithValue("@name", name);
            cmd.Parameters.AddWithValue("@email", email);
            cmd.Parameters.AddWithValue("@address", address);
            cmd.Parameters.AddWithValue("@password", password);
            cmd.Parameters.AddWithValue("@role", role);
            cmd.Parameters.AddWithValue("@sub_role", sub_role);
            cmd.Connection = con;
            con.Open();
            cmd.ExecuteNonQuery();
            con.Close();
            txtName.Text = null;
            txtEmail.Text = null;
            txtAddress.Text = null;
            txtPassword.Text = null;
            slctSubRole1.SelectedValue = null;
            shwUsersGrid();
        }

        protected void shwCourseGrid()
        {
            dt2 = new DataTable();
            SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["mycon"].ToString());

            con.Open();
            string query = "Select course.id as id,course.name as name,course.description as description,course.start_date as start_date,course.end_date as end_date,course.user_id as user_id,course.category as category,course.created_at as created_at,userdetail.name as username FROM tblCourses as course LEFT JOIN tblUsers as userdetail ON course.user_id = userdetail.id; ";

            adapt = new SqlDataAdapter(query, con);
            adapt.Fill(dt2);
            if (dt2.Rows.Count > 0)
            {
                grdCourses.DataSource = dt2;
                grdCourses.DataBind();
            }
            con.Close();
        }

        protected void grdCourses_RowEditing(object sender, System.Web.UI.WebControls.GridViewEditEventArgs e)
        {
            //NewEditIndex property used to determine the index of the row being edited.  
            grdCourses.EditIndex = e.NewEditIndex;
            shwCourseGrid();
        }
        protected void grdCourses_RowUpdating(object sender, System.Web.UI.WebControls.GridViewUpdateEventArgs e)
        {
            //Finding the controls from Gridview for the row which is going to update  
            Label id = grdCourses.Rows[e.RowIndex].FindControl("lbl_ID") as Label;
            TextBox name = grdCourses.Rows[e.RowIndex].FindControl("txtName") as TextBox;
            TextBox description = grdCourses.Rows[e.RowIndex].FindControl("txtDescription") as TextBox;
            TextBox start_date = grdCourses.Rows[e.RowIndex].FindControl("txtStartDate") as TextBox;
            TextBox end_date = grdCourses.Rows[e.RowIndex].FindControl("txtEndDate") as TextBox;
            SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["mycon"].ToString());

            con.Open();
            //updating the record  
            SqlCommand cmd = new SqlCommand("Update tblCourses set name='" + name.Text + "',description='" + description.Text + "',start_date='" + start_date.Text + "',end_date='" + end_date.Text + "' where ID=" + Convert.ToInt32(id.Text), con);
            cmd.ExecuteNonQuery();
            con.Close();
            //Setting the EditIndex property to -1 to cancel the Edit mode in Gridview  
            grdCourses.EditIndex = -1;
            //Call ShowData method for displaying updated data  
            shwCourseGrid();
        }
        protected void grdCourses_RowCancelingEdit(object sender, System.Web.UI.WebControls.GridViewCancelEditEventArgs e)
        {
            //Setting the EditIndex property to -1 to cancel the Edit mode in Gridview  
            grdCourses.EditIndex = -1;
            shwCourseGrid();
        }

        protected void grdCourses_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {

            GridViewRow row = (GridViewRow)grdCourses.Rows[e.RowIndex];
            Label lbldeleteid = (Label)row.FindControl("Id");
            int id = Convert.ToInt32(grdCourses.DataKeys[e.RowIndex].Value.ToString());
            con.Open();
            SqlCommand cmd = new SqlCommand("DELETE FROM tblCourses WHERE id = '" + id + "'", con);
            cmd.ExecuteNonQuery();
            con.Close();
            shwCourseGrid();
        }

        protected void btnAddCourse_Click(object sender, EventArgs e)
        {
            dt2 = new DataTable();
            SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["mycon"].ToString());

            string cname = txtCName.Text;
            string description = txtDescription.Text;
            string start_date = txtStartDate.Text;
            string end_date = txtEndDate.Text;

            //string user_id = Session["user_id"].ToString();
            int user_id = 1;

            string query = "INSERT INTO tblCourses VALUES(@name, @description, @start_date, @end_date, @user_id)";
            SqlCommand cmd = new SqlCommand(query);
            cmd.Parameters.AddWithValue("@name", cname);
            cmd.Parameters.AddWithValue("@description", description);
            cmd.Parameters.AddWithValue("@start_date", start_date);
            cmd.Parameters.AddWithValue("@end_date", end_date);
            cmd.Parameters.AddWithValue("@user_id", user_id);
            cmd.Connection = con;
            con.Open();
            cmd.ExecuteNonQuery();
            con.Close();

            txtName.Text = null;
            txtDescription.Text = null;
            txtStartDate.Text = null;
            txtEndDate.Text = null;
            shwCourseGrid();
        }

        protected void shwFeedbackGrid()
        {
             dt3 = new DataTable();
            SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["mycon"].ToString());

            con.Open();
            adapt = new SqlDataAdapter("Select Id,name,email,subject,message from tblFeedback", con);
            adapt.Fill(dt3);
            if (dt3.Rows.Count > 0)
            {
                grdFeedback.DataSource = dt3;
                grdFeedback.DataBind();
            }
            con.Close();
        }

        protected void grdFeedback_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {

            GridViewRow row = (GridViewRow)grdFeedback.Rows[e.RowIndex];
            Label lbldeleteid = (Label)row.FindControl("Id");
            int id = Convert.ToInt32(grdFeedback.DataKeys[e.RowIndex].Value.ToString());
            con.Open();
            SqlCommand cmd = new SqlCommand("DELETE FROM tblFeedback WHERE id = '" + id + "'", con);
            cmd.ExecuteNonQuery();
            con.Close();
            shwFeedbackGrid();
        }

        private void BindRepeator()
        {
            string CS = ConfigurationManager.ConnectionStrings["mycon"].ConnectionString;
            //SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["mycon"].ToString());
            using (SqlConnection con = new SqlConnection(CS))
            {
                SqlCommand cmd = new SqlCommand("getCourseStudentDetails", con);
                cmd.CommandType = CommandType.StoredProcedure;
                con.Open();
                Repeater1.DataSource = cmd.ExecuteReader();
                Repeater1.DataBind();
            }
        }

        protected void btnSortCourses_Click(object sender, EventArgs e)
        {
            dt3 = new DataTable();
            SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["mycon"].ToString());

            con.Open();
            adapt = new SqlDataAdapter("Select course.id as id,course.name as name,course.description as description,course.start_date as start_date,course.end_date as end_date,course.user_id as user_id,course.category as category,course.created_at as created_at,userdetail.name as username FROM tblCourses as course LEFT JOIN tblUsers as userdetail ON course.user_id = userdetail.id ORDER BY course.created_at DESC", con);
            adapt.Fill(dt3);
            if (dt3.Rows.Count > 0)
            {
                grdCourses.DataSource = dt3;
                grdCourses.DataBind();
            }
            con.Close();
        }

        protected void btnSortStartDate_Click(object sender, EventArgs e)
        {
            dt3 = new DataTable();
            SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["mycon"].ToString());

            con.Open();
            adapt = new SqlDataAdapter("Select course.id as id,course.name as name,course.description as description,course.start_date as start_date,course.end_date as end_date,course.user_id as user_id,course.category as category,course.created_at as created_at,userdetail.name as username FROM tblCourses as course LEFT JOIN tblUsers as userdetail ON course.user_id = userdetail.id ORDER BY course.start_date DESC", con);
            adapt.Fill(dt3);
            if (dt3.Rows.Count > 0)
            {
                grdCourses.DataSource = dt3;
                grdCourses.DataBind();
            }
            con.Close();
        }
    }
}