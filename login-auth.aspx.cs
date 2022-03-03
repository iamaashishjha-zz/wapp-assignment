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
                SqlDataReader sdr = cmd.ExecuteReader();
                if (sdr.Read())
                {
                    int id = (int)sdr["id"];
                    Session["user_id"] = id;
                    Session["user_email"] = null;
                    Response.Redirect("~/home1.aspx");

                }
                else
                {
                    lblError.Visible = true;
                    lblError.Text = "Invalid Email/Passwords";

                }
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