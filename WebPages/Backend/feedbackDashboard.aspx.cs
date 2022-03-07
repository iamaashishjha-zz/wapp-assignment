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
    public partial class feedbackDashboard : System.Web.UI.Page
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
                    
                    shwFeedbackGrid();
                }
            }
            else
            {
                Response.Redirect("~/home.aspx");
            }
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
    }
}