using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;  
using System.Configuration;

namespace wapp
{
    public partial class login_auth : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if(Session["user_id"] == null)
            {
                if (Session["error"] != null)
                {
                    lblError.Visible = true;
                    lblError.Text = Session["error"].ToString();
                }
                if (Session["email"] != null)
                {
                    txtEmail.Text = Session["user_email"].ToString();
                }
            }
            else
            {
                Response.Redirect("~/home.aspx");
            }
        }

        protected void btnLogin_Click(object sender, EventArgs e)
        {
            string email = txtEmail.Text;
            string password = txtPassword.Text;

            SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["mycon"].ToString());
            try
            {
                con.Open();
                string qry = "select * from tblUsers where email='" + email + "' and password='" + password + "'";
                SqlCommand cmd = new SqlCommand(qry, con);
                SqlDataReader sdrLogin = cmd.ExecuteReader();
                if (sdrLogin.Read())
                {
                    int id = (int)sdrLogin["id"];
                    string role = (string)sdrLogin["role"];
                    string sub_role = (string)sdrLogin["sub_role"];
                    Session["user_id"] = id;
                    Session["user_role"] = role;
                    Session["user_sub_role"] = sub_role;
                    Session["user_email"] = email;
                    Response.Redirect("~/home.aspx");

                }
                else
                {
                    lblError.Visible = true;
                    lblError.Text = "Invalid Email/Passwords";

                }

                sdrLogin.Close();
            }
            catch (Exception ex)
            {
                Response.Write(ex.Message);
            }
            finally
            {
                con.Close();

            }
        }

        protected void btnRegister_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/register-auth.aspx");
        }
    }
}