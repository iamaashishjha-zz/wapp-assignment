﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using System.Web.UI.WebControls;

namespace wapp
{
    public partial class userList : System.Web.UI.Page
    {


        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["mycon"].ToString());
        SqlDataAdapter adapt;
        DataTable dt;
        protected void Page_Load(object sender, EventArgs e)
        {
            //if((Session["user_id"] != null) && (Session["user_role"] == "Admin"))
            //{
            //    if (!IsPostBack)
            //    {
            //        ShowData();
            //    }
            //}
            //else
            //{
            //    Response.Redirect("~/index1.aspx");
            //}
            if (!IsPostBack)
            {
                ShowData();
            }

        }

        protected void ShowData()
        {
            dt = new DataTable();
            SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["mycon"].ToString());

            con.Open();
            adapt = new SqlDataAdapter("Select Id,name,email,address,role,sub_role from tblUsers", con);
            adapt.Fill(dt);
            if (dt.Rows.Count > 0)
            {
                GridView1.DataSource = dt;
                GridView1.DataBind();
            }
            con.Close();
        }

        protected void GridView1_RowEditing(object sender, System.Web.UI.WebControls.GridViewEditEventArgs e)
        {
            //NewEditIndex property used to determine the index of the row being edited.  
            GridView1.EditIndex = e.NewEditIndex;
            ShowData();
        }
        protected void GridView1_RowUpdating(object sender, System.Web.UI.WebControls.GridViewUpdateEventArgs e)
        {
            //Finding the controls from Gridview for the row which is going to update  
            Label id = GridView1.Rows[e.RowIndex].FindControl("lbl_ID") as Label;
            TextBox name = GridView1.Rows[e.RowIndex].FindControl("txtName") as TextBox;
            TextBox email = GridView1.Rows[e.RowIndex].FindControl("txtEmail") as TextBox;
            TextBox address = GridView1.Rows[e.RowIndex].FindControl("txtAddress") as TextBox;
            TextBox role = GridView1.Rows[e.RowIndex].FindControl("txtRole") as TextBox;
            //TextBox sub_role = GridView1.Rows[e.RowIndex].FindControl("txtSubRole") as TextBox;
            DropDownList ddList = (DropDownList)GridView1.Rows[e.RowIndex].FindControl("slctSubRole");
            SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["mycon"].ToString());

            con.Open();
            //updating the record  
            SqlCommand cmd = new SqlCommand("Update tblUsers set name='" + name.Text + "',email='" + email.Text + "',address='" + address.Text + "',sub_role='" + ddList.SelectedValue + "' where ID=" + Convert.ToInt32(id.Text), con);
            cmd.ExecuteNonQuery();
            con.Close();
            //Setting the EditIndex property to -1 to cancel the Edit mode in Gridview  
            GridView1.EditIndex = -1;
            //Call ShowData method for displaying updated data  
            ShowData();
        }
        protected void GridView1_RowCancelingEdit(object sender, System.Web.UI.WebControls.GridViewCancelEditEventArgs e)
        {
            //Setting the EditIndex property to -1 to cancel the Edit mode in Gridview  
            GridView1.EditIndex = -1;
            ShowData();
        }

        protected void OnRowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            
            GridViewRow row = (GridViewRow)GridView1.Rows[e.RowIndex];
            Label lbldeleteid = (Label) row.FindControl("Id");
            int id = Convert.ToInt32(GridView1.DataKeys[e.RowIndex].Value.ToString());
            con.Open();
            SqlCommand cmd = new SqlCommand("DELETE FROM tblUsers WHERE id = '"+id+"'",con);
            cmd.ExecuteNonQuery();
            con.Close();
            ShowData();
        }

        protected void Insert(object sender, EventArgs e)
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
            ShowData();
        }


    }
}