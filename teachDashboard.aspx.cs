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
        protected void Page_Load(object sender, EventArgs e)
        {
            
            if ((Session["user_id"] != null) && (Session["user_sub_role"].ToString() == "Teacher"))
            {
                string user_id = Session["user_id"].ToString();
                if (!IsPostBack)
                {
                    
                    string emailcheckquery = "select * from tblUsers where id='" + user_id + "'";
                    SqlCommand emailcheckcmd = new SqlCommand(emailcheckquery, con);
                    con.Open();

                    SqlDataReader sdr = emailcheckcmd.ExecuteReader();
                    if (sdr.Read())
                    {
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

        }


        protected void btnUpdateInfo_Click(object sender, EventArgs e)
        {
         
            SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["mycon"].ToString());

            string Tname = txtTName.Text;
            string email = txtEmail.Text;
            string address = txtAddress.Text;
            string password = txtPassword.Text;
            int user_id = (int)Session["user_id"];

            SqlCommand cmd = new SqlCommand("Update tblUsers set name='" + Tname + "',email='" + email + "',address='" + address + "',password='" + password + "' where ID=" + user_id, con);
            con.Open();
            
            cmd.Connection = con;
            //con.Open();
            cmd.ExecuteNonQuery();
            con.Close();

            txtTName.Text = null;
            txtEmail.Text = null;
            txtAddress.Text = null;
            txtPassword.Text = null;
        }
    }
}