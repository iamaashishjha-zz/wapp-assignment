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

namespace wapp
{
    public partial class teachDashboard : System.Web.UI.Page
    {
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["mycon"].ToString());
        SqlDataAdapter adapt;
        DataTable dt;
        DataTable dt2;
        DataTable dt3;
        protected void Page_Load(object sender, EventArgs e)
        {
            //string user_role = Session["user_sub_role"].ToString();
            
            if ((Session["user_id"] != null) && (Session["user_sub_role"].ToString() == "Teacher"))
            {
                string user_id = Session["user_id"].ToString();
                if (!IsPostBack)
                {
                    ShowData2();
                    string emailcheckquery = "select * from tblUsers where id='" + user_id + "'";
                    SqlCommand emailcheckcmd = new SqlCommand(emailcheckquery, con);
                    con.Open();

                    SqlDataReader sdr = emailcheckcmd.ExecuteReader();
                    if (sdr.Read())
                    {
                        //Session["error"] = "Email Already Registered. Login";
                        //Session["user_email"] = txtEmail.Text;
                        //Response.Redirect("~/login-auth.aspx");
                        string name = (string)sdr["name"];
                        string Temail = (string)sdr["email"];
                        string Taddress = (string)sdr["address"];
                        string Tpassword = (string)sdr["password"];

                        txtTName.Text = name;
                        txtEmail.Text = Temail;
                        txtAddress.Text = Taddress;
                        txtPassword.Text = Tpassword;
                    }
                    con.Close();
                }
            }
            else
            {
                Response.Redirect("~/home.aspx");
            }
            //if (!IsPostBack)
            //{
            //    //ShowData();
            //    ShowData2();
            //}

        }

        protected void ShowData2()
        {
            dt2 = new DataTable();
            SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["mycon"].ToString());

            con.Open();
            adapt = new SqlDataAdapter("Select id,name,description,start_date,end_date,category,created_at from tblCourses", con);
            adapt.Fill(dt2);
            if (dt2.Rows.Count > 0)
            {
                GridView2.DataSource = dt2;
                GridView2.DataBind();
            }
            con.Close();
        }

        protected void GridView2_RowEditing(object sender, System.Web.UI.WebControls.GridViewEditEventArgs e)
        {
            //NewEditIndex property used to determine the index of the row being edited.  
            GridView2.EditIndex = e.NewEditIndex;
            ShowData2();
        }
        protected void GridView2_RowUpdating(object sender, System.Web.UI.WebControls.GridViewUpdateEventArgs e)
        {
            //Finding the controls from Gridview for the row which is going to update  
            Label id = GridView2.Rows[e.RowIndex].FindControl("lbl_ID") as Label;
            TextBox name = GridView2.Rows[e.RowIndex].FindControl("txtName") as TextBox;
            TextBox description = GridView2.Rows[e.RowIndex].FindControl("txtDescription") as TextBox;
            TextBox start_date = GridView2.Rows[e.RowIndex].FindControl("txtStartDate") as TextBox;
            TextBox end_date = GridView2.Rows[e.RowIndex].FindControl("txtEndDate") as TextBox;
            SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["mycon"].ToString());

            con.Open();
            //updating the record  
            SqlCommand cmd = new SqlCommand("Update tblCourses set name='" + name.Text + "',description='" + description.Text + "',start_date='" + start_date.Text + "',end_date='" + end_date.Text + "' where ID=" + Convert.ToInt32(id.Text), con);
            cmd.ExecuteNonQuery();
            con.Close();
            //Setting the EditIndex property to -1 to cancel the Edit mode in Gridview  
            GridView2.EditIndex = -1;
            //Call ShowData method for displaying updated data  
            ShowData2();
        }
        protected void GridView2_RowCancelingEdit(object sender, System.Web.UI.WebControls.GridViewCancelEditEventArgs e)
        {
            //Setting the EditIndex property to -1 to cancel the Edit mode in Gridview  
            GridView2.EditIndex = -1;
            ShowData2();
        }

        protected void OnRowDeleting2(object sender, GridViewDeleteEventArgs e)
        {

            GridViewRow row = (GridViewRow)GridView2.Rows[e.RowIndex];
            Label lbldeleteid = (Label)row.FindControl("Id");
            int id = Convert.ToInt32(GridView2.DataKeys[e.RowIndex].Value.ToString());
            con.Open();
            SqlCommand cmd = new SqlCommand("DELETE FROM tblCourses WHERE id = '" + id + "'", con);
            cmd.ExecuteNonQuery();
            con.Close();
            ShowData2();
        }

        protected void Insert2(object sender, EventArgs e)
        {
            dt2 = new DataTable();
            SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["mycon"].ToString());

            string cname = txtCName.Text;
            string description = txtDescription.Text;
            string start_date = txtStartDate.Text;
            string end_date = txtEndDate.Text;
            string category = slctSubRole1.SelectedValue;
            DateTime date = DateTime.Now;

            //string user_id = Session["user_id"].ToString();
            int user_id = (int)Session["user_id"];

            string query = "INSERT INTO tblCourses VALUES(@name, @description, @start_date, @end_date, @user_id, @created_at, @category)";
            SqlCommand cmd = new SqlCommand(query);
            cmd.Parameters.AddWithValue("@name", cname);
            cmd.Parameters.AddWithValue("@description", description);
            cmd.Parameters.AddWithValue("@start_date", start_date);
            cmd.Parameters.AddWithValue("@end_date", end_date);
            cmd.Parameters.AddWithValue("@user_id", user_id);
            cmd.Parameters.AddWithValue("@created_at", date.ToString());
            cmd.Parameters.AddWithValue("@category", category);
            cmd.Connection = con;
            con.Open();
            cmd.ExecuteNonQuery();
            con.Close();

            txtCName.Text = null;
            txtDescription.Text = null;
            txtStartDate.Text = null;
            txtEndDate.Text = null;
            ShowData2();
        }


        protected void Insert3(object sender, EventArgs e)
        {
         
            SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["mycon"].ToString());

            string Tname = txtTName.Text;
            string email = txtEmail.Text;
            string address = txtAddress.Text;
            string password = txtPassword.Text;
            int user_id = (int)Session["user_id"];

            //string user_id = Session["user_id"].ToString();
            //int user_id = 1;

            //string query = "INSERT INTO tblCourses VALUES(@name, @email, @address, @password)";
            //string query = "Update tblCourses set name''";
            SqlCommand cmd = new SqlCommand("Update tblUsers set name='" + Tname + "',email='" + email + "',address='" + address + "',password='" + password + "' where ID=" + user_id, con);
            con.Open();
            

            //SqlCommand cmd = new SqlCommand(query);
            //cmd.Parameters.AddWithValue("@name", Tname);
            //cmd.Parameters.AddWithValue("@description", description);
            //cmd.Parameters.AddWithValue("@start_date", start_date);
            //cmd.Parameters.AddWithValue("@end_date", end_date);
            //cmd.Parameters.AddWithValue("@user_id", user_id);
            cmd.Connection = con;
            //con.Open();
            cmd.ExecuteNonQuery();
            con.Close();

            txtTName.Text = null;
            txtEmail.Text = null;
            txtAddress.Text = null;
            txtPassword.Text = null;
        }

        protected void btnSortCourses_Click(object sender, EventArgs e)
        {
            dt3 = new DataTable();
            SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["mycon"].ToString());

            con.Open();
            adapt = new SqlDataAdapter("Select id,name,description,start_date,end_date,category,created_at from tblCourses ORDER BY created_at", con);
            adapt.Fill(dt3);
            if (dt3.Rows.Count > 0)
            {
                GridView2.DataSource = dt3;
                GridView2.DataBind();
            }
            con.Close();
        }
    }
}