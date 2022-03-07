using System;
using System.IO;

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
    public partial class noteDashboard : System.Web.UI.Page
    {
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["mycon"].ToString());
        SqlDataAdapter adapt;
        DataTable dt2;
        protected void Page_Load(object sender, EventArgs e)
        {
            if ((Session["user_id"] != null) && ((Session["user_role"].ToString() == "Admin") || (Session["user_sub_role"].ToString() == "Teacher")))
            {
                if (!IsPostBack)
                {
                    shwNotesGrid();

                    string query = "SELECT id,name FROM tblCourses";
                    string constr = ConfigurationManager.ConnectionStrings["mycon"].ConnectionString;
                    using (SqlConnection conn = new SqlConnection(constr))
                    {
                        using (SqlCommand cmd = new SqlCommand(query))
                        {
                            cmd.CommandType = CommandType.Text;
                            cmd.Connection = conn;
                            conn.Open();
                            using (SqlDataReader sdr = cmd.ExecuteReader())
                            {
                                while (sdr.Read())
                                {
                                    ListItem item = new ListItem();
                                    item.Text = sdr["name"].ToString();
                                    item.Value = sdr["id"].ToString();
                                    slctCourse.Items.Add(item);

                                }
                            }
                            conn.Close();
                        }
                    }
                    slctCourse.Items.Insert(0, new ListItem("--Select Course--", "0"));

                    
                    
                }
            }
            else
            {
                Response.Redirect("~/home.aspx");
            }
        }

        protected void shwNotesGrid()
        {
            dt2 = new DataTable();
            SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["mycon"].ToString());

            con.Open();
            string query = "Select note.id as id,note.name as name,note.description as description,course.name as courseName,course.image as courseName,note.file_path as fileUpload,course.category as category FROM tblNotes as note LEFT JOIN tblCourses as course ON course.id = note.id; ";

            adapt = new SqlDataAdapter(query, con);
            adapt.Fill(dt2);
            if (dt2.Rows.Count > 0)
            {
                grdNotes.DataSource = dt2;
                grdNotes.DataBind();
            }
            con.Close();
        }

        protected void grdNotes_RowEditing(object sender, System.Web.UI.WebControls.GridViewEditEventArgs e)
        {
            //NewEditIndex property used to determine the index of the row being edited.  
            grdNotes.EditIndex = e.NewEditIndex;
            shwNotesGrid();
        }
        protected void grdNotes_RowUpdating(object sender, System.Web.UI.WebControls.GridViewUpdateEventArgs e)
        {


            string imageId = grdNotes.DataKeys[e.RowIndex].Value.ToString();
            FileUpload fileUpload1 = (FileUpload)grdNotes.Rows[e.RowIndex].FindControl("fileUpload1");
            string path = "~/Images/Notes/";
            if (fileUpload1.HasFile)
            {
                path += fileUpload1.FileName;
                //save image in folder
                fileUpload1.SaveAs(MapPath(path));
            }
            else
            {
                // use previous user image if new image is not changed
                Image img1 = (Image)grdNotes.Rows[e.RowIndex].FindControl("fileUpload1");
                path = img1.ImageUrl;
            }

            //Finding the controls from Gridview for the row which is going to update  
            Label id = grdNotes.Rows[e.RowIndex].FindControl("lbl_ID") as Label;
            TextBox name = grdNotes.Rows[e.RowIndex].FindControl("txtName") as TextBox;
            TextBox description = grdNotes.Rows[e.RowIndex].FindControl("txtDescription") as TextBox;
            DropDownList ddList = (DropDownList)grdNotes.Rows[e.RowIndex].FindControl("slctCourse1");
            DateTime date = DateTime.Now;
            SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["mycon"].ToString());

            con.Open();
            //updating the record  
            SqlCommand cmd = new SqlCommand("Update tblNotes set name='" + name.Text + "',description='" + description.Text + "',file_path='" + path + "',course_id='" + ddList.SelectedValue + "' where ID=" + Convert.ToInt32(id.Text), con);
            cmd.ExecuteNonQuery();
            con.Close();
            //Setting the EditIndex property to -1 to cancel the Edit mode in Gridview  
            grdNotes.EditIndex = -1;
            //Call ShowData method for displaying updated data  
            shwNotesGrid();
        }
        protected void grdNotes_RowCancelingEdit(object sender, System.Web.UI.WebControls.GridViewCancelEditEventArgs e)
        {
            //Setting the EditIndex property to -1 to cancel the Edit mode in Gridview  
            grdNotes.EditIndex = -1;
            shwNotesGrid();
        }

        protected void grdNotes_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {

            GridViewRow row = (GridViewRow)grdNotes.Rows[e.RowIndex];
            Label lbldeleteid = (Label)row.FindControl("Id");
            int id = Convert.ToInt32(grdNotes.DataKeys[e.RowIndex].Value.ToString());
            con.Open();
            SqlCommand cmd = new SqlCommand("DELETE FROM tblNotes WHERE id = '" + id + "'", con);
            cmd.ExecuteNonQuery();
            con.Close();
            shwNotesGrid();
        }

        protected void btnAddNotes_Click(object sender, EventArgs e)
        {
            dt2 = new DataTable();
            //SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["mycon"].ToString());


            string name = txtName.Text;
            string description = txtDescription.Text;
            string course_id = slctCourse.SelectedValue;
            string filename = Path.GetFileName(flUpload.PostedFile.FileName);
            string contentType = flUpload.PostedFile.ContentType;
            using (Stream fs = flUpload.PostedFile.InputStream)
            {
                using (BinaryReader br = new BinaryReader(fs))
                {
                    byte[] bytes = br.ReadBytes((Int32)fs.Length);
                    string constr = ConfigurationManager.ConnectionStrings["mycon"].ConnectionString;
                    using (SqlConnection con = new SqlConnection(constr))
                    {
                        string query = "insert into tblNotes values (@name, @description, @course_id, @file_path)";
                        using (SqlCommand cmd = new SqlCommand(query))
                        {
                            cmd.Connection = con;
                            cmd.Parameters.AddWithValue("@name", name);
                            cmd.Parameters.AddWithValue("@description", description);
                            cmd.Parameters.AddWithValue("@course_id", course_id);
                            cmd.Parameters.AddWithValue("@file_path", bytes);
                            con.Open();
                            cmd.ExecuteNonQuery();
                            con.Close();
                        }
                    }
                }
            }
            shwNotesGrid();
        }


        protected void OnRowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                //Find the DropDownList in the Row
                DropDownList ddlCountries = (e.Row.FindControl("ddlCountries") as DropDownList);
                ddlCountries.DataSource = GetData("SELECT id,name FROM tblCourses");
                ddlCountries.DataTextField = "Country";
                ddlCountries.DataValueField = "Country";
                ddlCountries.DataBind();

                //Add Default Item in the DropDownList
                ddlCountries.Items.Insert(0, new ListItem("Please select"));

                //Select the Country of Customer in DropDownList
                string country = (e.Row.FindControl("lbl_course") as Label).Text;
                ddlCountries.Items.FindByValue(country).Selected = true;
            }
        }

        private DataSet GetData(string query)
        {
            string conString = ConfigurationManager.ConnectionStrings["mycon"].ConnectionString;
            SqlCommand cmd = new SqlCommand(query);
            using (SqlConnection con = new SqlConnection(conString))
            {
                using (SqlDataAdapter sda = new SqlDataAdapter())
                {
                    cmd.Connection = con;
                    sda.SelectCommand = cmd;
                    using (DataSet ds = new DataSet())
                    {
                        sda.Fill(ds);
                        return ds;
                    }
                }
            }
        }

    }
}