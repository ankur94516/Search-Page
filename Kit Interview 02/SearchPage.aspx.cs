using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;

namespace Kit_Interview_02
{
    public partial class SearchPage : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnSearch_Click(object sender, EventArgs e)
        {
            string conjunction = ddlConjunction.Value;

            string connectionStr = ConfigurationManager
                .ConnectionStrings["connectionStr"].ConnectionString;
            using (SqlConnection con = new SqlConnection(connectionStr))
            {
                SqlCommand cmd = new SqlCommand();
                cmd.Connection = con;
                if (conjunction == "AND")
                {
                    cmd.CommandText = "sp_SearchProductAND";
                }
                else
                {
                    cmd.CommandText = "sp_SearchProductOR";
                }
                cmd.CommandType = CommandType.StoredProcedure;

                if (inputProductName.Value.Trim() != "")
                {
                    SqlParameter param = new SqlParameter
                        ("@ProductName", inputProductName.Value);
                    cmd.Parameters.Add(param);
                }

                if (inputSize.Value.Trim() != "")
                {
                    SqlParameter param = new SqlParameter
                        ("@Size", inputSize.Value);
                    cmd.Parameters.Add(param);
                }

                if (inputPrice.Value.Trim() != "")
                {
                    SqlParameter param = new SqlParameter
                        ("@Price", inputPrice.Value);
                    cmd.Parameters.Add(param);
                }

                if (inputMfgDate.Value.Trim() != "")
                {
                    SqlParameter param = new SqlParameter
                        ("@MfgDate", inputMfgDate.Value);
                    cmd.Parameters.Add(param);
                }

                if (inputCategory.Value.Trim() != "")
                {
                    SqlParameter param = new SqlParameter
                        ("@Category", inputCategory.Value);
                    cmd.Parameters.Add(param);
                }

                con.Open();
                SqlDataReader rdr = cmd.ExecuteReader();
                gvSearchResults.DataSource = rdr;
                gvSearchResults.DataBind();
            }
        }

        protected void btnClear_Click(object sender, EventArgs e)
        {
            inputProductName.Value = string.Empty;
            inputSize.Value = string.Empty;
            inputPrice.Value = string.Empty;
            inputMfgDate.Value = string.Empty;
            inputCategory.Value = string.Empty;

        }
    }
}