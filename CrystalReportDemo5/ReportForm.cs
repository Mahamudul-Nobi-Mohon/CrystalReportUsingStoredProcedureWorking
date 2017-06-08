using CrystalDecisions.CrystalReports.Engine;
using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace CrystalReportDemo5
{
    public partial class ReportForm : Form
    {
      
        public ReportForm()
        {
            InitializeComponent();
        }

        private void ReportForm_Load(object sender, EventArgs e)
        {
            //DataTable dtReportData = GetData();
            //ShowReport(dtReportData);
        }

        private void ShowReport(DataTable dtReportData)
        {
            ReportDocument rdoc = new ReportDocument();
            rdoc.Load(@"Reports\CrystalReport1.rpt");
            rdoc.SetDataSource(dtReportData);
            crystalReportViewer1.ReportSource = rdoc;
        }

        private DataTable GetData()
        {
            DataTable dt = new DataTable();

           using (SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["DBCon"].ConnectionString))
            {
               using (SqlCommand cmd = new SqlCommand("getCustomersWithSalary", con))
                {
                    cmd.CommandType = CommandType.StoredProcedure;
                    con.Open();
                    cmd.Parameters.AddWithValue("@startDate", startDateTimePicker.Text);
                    cmd.Parameters.AddWithValue("@endDate", endDateTimePicker.Text);

                    SqlDataReader reader = cmd.ExecuteReader();
                    dt.Load(reader);

                }
            }

            return dt;
        }

        private void showReportButton_Click(object sender, EventArgs e)
        {
            DataTable dtReportData = GetData();
            ShowReport(dtReportData);
        }
    }
}
