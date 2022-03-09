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
            Page.Validate("registerValidation");
            if (Page.IsValid)
            {
                string name = txtName.Text;
                string email = txtEmail.Text;
                string password = txtPassword.Text;
                string address = txtAddress.Text;
                string role = "User";
                string sub_role_value = slctRole.SelectedItem.Value;


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
                    sdr.Close();
                    emailcheckcmd.Dispose();
                    string qry = "insert into tblUsers(name,email,address,password,role,sub_role) values('" + name + "','" + email + "', '" + address + "', '" + password + "','" + role + "','" + sub_role_value + "')";
                    SqlCommand cmd = new SqlCommand(qry, con);
                    SqlDataAdapter ds = new SqlDataAdapter();
                    ds.InsertCommand = cmd;
                    ds.InsertCommand.ExecuteNonQuery();
                    cmd.Dispose();
                    Session["error"] = "Email Registered Successfully. Login Now";
                    Response.Redirect("~/login-auth.aspx");

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
                    slctRole.SelectedIndex = 0;
                    txtCPassword.Text = "";
                    con.Close();
                }
            }
        }
    }
}