using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

namespace wapp
{
    public partial class register_auth : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["error"] != null)
            {
                lblError.Visible = true;
                lblError.Text = Session["error"].ToString();
            }
        }

        protected void btnLogin_Click(object sender, EventArgs e)
        {
            txtName.Text = null;
            txtEmail.Text = null;
            txtPassword.Text = null;
            slctRole.SelectedIndex = 0;
            Response.Redirect("~/login-auth.aspx");
        }

        protected void btnRegister_Click(object sender, EventArgs e)
        {
            
            SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["mycon"].ToString());
            string name = txtName.Text;
            string email = txtEmail.Text;
            string password = txtPassword.Text;
            int role = 0;
            int sub_role = slctRole.SelectedIndex;


            try
            {
                con.Open();
                string emailcheckquery = "select * from tblUsers where email='" + email + "'";
                SqlCommand emailcheckcmd = new SqlCommand(emailcheckquery, con);

                SqlDataReader sdr = emailcheckcmd.ExecuteReader();
                if (sdr.Read())
                {
                    Session["error"] = "Email Already Registered. Login";
                    Session["user_email"] = txtEmail.Text;
                    Response.Redirect("~/login-auth.aspx");
                }
                else
                {
                    lblError.Visible = true;
                    lblError.Text = "Invalid Email/Passwords";
                }

                string qry = "insert into tblUsers values('@name','@email','@password','@role','@sub_role')";
                SqlCommand cmd = new SqlCommand(qry, con);
                cmd.Parameters.AddWithValue("name", name);
                cmd.Parameters.AddWithValue("email", email);
                cmd.Parameters.AddWithValue("password", password);
                cmd.Parameters.AddWithValue("role", role);
                cmd.Parameters.AddWithValue("sub_role", sub_role);
                cmd.ExecuteNonQuery();


            }
            catch (Exception ex)
            {
                lblError.Visible = true;
                lblError.Text = "<b>Registration Failed. Because, </b>" + ex;
            }
            finally
            {
                txtName.Text = "";
                txtEmail.Text = "";
                txtEmail.Text = "";
                txtPassword.Text = "";
                slctRole.SelectedValue = "";
                txtCPassword.Text = "";
                con.Close();
            }
        }
    }
}