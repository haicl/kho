namespace Warehouse1
{
    public class MyReport : DevExpress.XtraReports.UI.XtraReport
    {
        private DevExpress.XtraReports.UI.TopMarginBand TopMargin;
        private DevExpress.XtraReports.UI.PageHeaderBand PageHeader;
        private DevExpress.XtraReports.UI.XRLabel label1;
        private DevExpress.XtraReports.UI.XRLabel label2;
        private DevExpress.XtraReports.UI.XRLabel label3;
        private DevExpress.XtraReports.UI.XRLabel label4;
        private DevExpress.XtraReports.UI.XRLabel label5;
        private DevExpress.XtraReports.UI.XRLabel label6;
        private DevExpress.XtraReports.UI.XRLabel label7;
        private DevExpress.XtraReports.UI.DetailBand Detail;
        private DevExpress.XtraReports.UI.XRLabel label8;
        private DevExpress.XtraReports.UI.XRLabel label9;
        private DevExpress.XtraReports.UI.XRLabel label10;
        private DevExpress.XtraReports.UI.XRLabel label11;
        private DevExpress.XtraReports.UI.XRLabel label12;
        private DevExpress.XtraReports.UI.XRLabel label13;
        private DevExpress.XtraReports.UI.ReportFooterBand ReportFooter;
        private DevExpress.XtraReports.UI.XRLabel label14;
        private DevExpress.XtraReports.UI.XRLabel label15;
        private DevExpress.XtraReports.UI.XRLabel label16;
        private DevExpress.XtraReports.UI.XRLabel label17;
        private DevExpress.XtraReports.UI.XRLabel label18;
        private DevExpress.XtraReports.UI.XRLabel label19;
        private DevExpress.XtraReports.UI.BottomMarginBand BottomMargin;
        private DevExpress.XtraReports.UI.XRControlStyle ReportHeaderBandStyle;
        private DevExpress.XtraReports.UI.XRControlStyle ReportGroupHeaderBandStyle;
        private DevExpress.XtraReports.UI.XRControlStyle ReportDetailBandStyle;
        private DevExpress.XtraReports.UI.XRControlStyle ReportGroupFooterBandStyle;
        private DevExpress.XtraReports.UI.XRControlStyle ReportFooterBandStyle;
        private DevExpress.XtraReports.UI.XRControlStyle ReportOddStyle;
        private DevExpress.XtraReports.UI.XRControlStyle ReportEvenStyle;

        public MyReport()
        {
            InitializeComponent();
        }

        private void InitializeComponent()
        {
            DevExpress.XtraReports.UI.XRSummary xrSummary1 = new DevExpress.XtraReports.UI.XRSummary();
            DevExpress.XtraReports.UI.XRSummary xrSummary2 = new DevExpress.XtraReports.UI.XRSummary();
            this.TopMargin = new DevExpress.XtraReports.UI.TopMarginBand();
            this.PageHeader = new DevExpress.XtraReports.UI.PageHeaderBand();
            this.Detail = new DevExpress.XtraReports.UI.DetailBand();
            this.ReportFooter = new DevExpress.XtraReports.UI.ReportFooterBand();
            this.BottomMargin = new DevExpress.XtraReports.UI.BottomMarginBand();
            this.label1 = new DevExpress.XtraReports.UI.XRLabel();
            this.label2 = new DevExpress.XtraReports.UI.XRLabel();
            this.label3 = new DevExpress.XtraReports.UI.XRLabel();
            this.label4 = new DevExpress.XtraReports.UI.XRLabel();
            this.label5 = new DevExpress.XtraReports.UI.XRLabel();
            this.label6 = new DevExpress.XtraReports.UI.XRLabel();
            this.label7 = new DevExpress.XtraReports.UI.XRLabel();
            this.label8 = new DevExpress.XtraReports.UI.XRLabel();
            this.label9 = new DevExpress.XtraReports.UI.XRLabel();
            this.label10 = new DevExpress.XtraReports.UI.XRLabel();
            this.label11 = new DevExpress.XtraReports.UI.XRLabel();
            this.label12 = new DevExpress.XtraReports.UI.XRLabel();
            this.label13 = new DevExpress.XtraReports.UI.XRLabel();
            this.label14 = new DevExpress.XtraReports.UI.XRLabel();
            this.label15 = new DevExpress.XtraReports.UI.XRLabel();
            this.label16 = new DevExpress.XtraReports.UI.XRLabel();
            this.label17 = new DevExpress.XtraReports.UI.XRLabel();
            this.label18 = new DevExpress.XtraReports.UI.XRLabel();
            this.label19 = new DevExpress.XtraReports.UI.XRLabel();
            this.ReportHeaderBandStyle = new DevExpress.XtraReports.UI.XRControlStyle();
            this.ReportGroupHeaderBandStyle = new DevExpress.XtraReports.UI.XRControlStyle();
            this.ReportDetailBandStyle = new DevExpress.XtraReports.UI.XRControlStyle();
            this.ReportGroupFooterBandStyle = new DevExpress.XtraReports.UI.XRControlStyle();
            this.ReportFooterBandStyle = new DevExpress.XtraReports.UI.XRControlStyle();
            this.ReportOddStyle = new DevExpress.XtraReports.UI.XRControlStyle();
            this.ReportEvenStyle = new DevExpress.XtraReports.UI.XRControlStyle();
            ((System.ComponentModel.ISupportInitialize)(this)).BeginInit();
            // 
            // TopMargin
            // 
            this.TopMargin.Dpi = 254F;
            this.TopMargin.Name = "TopMargin";
            // 
            // PageHeader
            // 
            this.PageHeader.Controls.AddRange(new DevExpress.XtraReports.UI.XRControl[] {
            this.label1,
            this.label2,
            this.label3,
            this.label4,
            this.label5,
            this.label6,
            this.label7});
            this.PageHeader.Dpi = 254F;
            this.PageHeader.HeightF = 189F;
            this.PageHeader.Name = "PageHeader";
            this.PageHeader.StyleName = "ReportHeaderBandStyle";
            // 
            // Detail
            // 
            this.Detail.Controls.AddRange(new DevExpress.XtraReports.UI.XRControl[] {
            this.label8,
            this.label9,
            this.label10,
            this.label11,
            this.label12,
            this.label13});
            this.Detail.Dpi = 254F;
            this.Detail.EvenStyleName = "ReportEvenStyle";
            this.Detail.HeightF = 63F;
            this.Detail.HierarchyPrintOptions.Indent = 50.8F;
            this.Detail.Name = "Detail";
            this.Detail.OddStyleName = "ReportOddStyle";
            this.Detail.StyleName = "ReportDetailBandStyle";
            // 
            // ReportFooter
            // 
            this.ReportFooter.Controls.AddRange(new DevExpress.XtraReports.UI.XRControl[] {
            this.label14,
            this.label15,
            this.label16,
            this.label17,
            this.label18,
            this.label19});
            this.ReportFooter.Dpi = 254F;
            this.ReportFooter.HeightF = 63F;
            this.ReportFooter.Name = "ReportFooter";
            this.ReportFooter.StyleName = "ReportHeaderBandStyle";
            // 
            // BottomMargin
            // 
            this.BottomMargin.Dpi = 254F;
            this.BottomMargin.Name = "BottomMargin";
            // 
            // label1
            // 
            this.label1.Borders = ((DevExpress.XtraPrinting.BorderSide)((((DevExpress.XtraPrinting.BorderSide.Left | DevExpress.XtraPrinting.BorderSide.Top) 
            | DevExpress.XtraPrinting.BorderSide.Right) 
            | DevExpress.XtraPrinting.BorderSide.Bottom)));
            this.label1.Dpi = 254F;
            this.label1.LocationFloat = new DevExpress.Utils.PointFloat(0F, 0F);
            this.label1.Name = "label1";
            this.label1.SizeF = new System.Drawing.SizeF(1592F, 126F);
            this.label1.Text = "T?NG H?P T?N KHO";
            this.label1.WordWrap = false;
            // 
            // label2
            // 
            this.label2.Borders = ((DevExpress.XtraPrinting.BorderSide)((DevExpress.XtraPrinting.BorderSide.Left | DevExpress.XtraPrinting.BorderSide.Bottom)));
            this.label2.Dpi = 254F;
            this.label2.LocationFloat = new DevExpress.Utils.PointFloat(0F, 126F);
            this.label2.Name = "label2";
            this.label2.SizeF = new System.Drawing.SizeF(265.3333F, 63F);
            this.label2.Text = "Mã S?n Ph?m";
            this.label2.WordWrap = false;
            // 
            // label3
            // 
            this.label3.Borders = ((DevExpress.XtraPrinting.BorderSide)((DevExpress.XtraPrinting.BorderSide.Left | DevExpress.XtraPrinting.BorderSide.Bottom)));
            this.label3.Dpi = 254F;
            this.label3.LocationFloat = new DevExpress.Utils.PointFloat(265.3333F, 126F);
            this.label3.Name = "label3";
            this.label3.SizeF = new System.Drawing.SizeF(265.3333F, 63F);
            this.label3.Text = "Tên S?n Ph?m";
            this.label3.WordWrap = false;
            // 
            // label4
            // 
            this.label4.Borders = ((DevExpress.XtraPrinting.BorderSide)((DevExpress.XtraPrinting.BorderSide.Left | DevExpress.XtraPrinting.BorderSide.Bottom)));
            this.label4.Dpi = 254F;
            this.label4.LocationFloat = new DevExpress.Utils.PointFloat(530.6667F, 126F);
            this.label4.Name = "label4";
            this.label4.SizeF = new System.Drawing.SizeF(265.3333F, 63F);
            this.label4.Text = "Nhà Cung C?p";
            this.label4.WordWrap = false;
            // 
            // label5
            // 
            this.label5.Borders = ((DevExpress.XtraPrinting.BorderSide)((DevExpress.XtraPrinting.BorderSide.Left | DevExpress.XtraPrinting.BorderSide.Bottom)));
            this.label5.Dpi = 254F;
            this.label5.LocationFloat = new DevExpress.Utils.PointFloat(796F, 126F);
            this.label5.Name = "label5";
            this.label5.SizeF = new System.Drawing.SizeF(265.3333F, 63F);
            this.label5.Text = "??n V? Tính";
            this.label5.WordWrap = false;
            // 
            // label6
            // 
            this.label6.Borders = ((DevExpress.XtraPrinting.BorderSide)((DevExpress.XtraPrinting.BorderSide.Left | DevExpress.XtraPrinting.BorderSide.Bottom)));
            this.label6.Dpi = 254F;
            this.label6.LocationFloat = new DevExpress.Utils.PointFloat(1061.333F, 126F);
            this.label6.Name = "label6";
            this.label6.SizeF = new System.Drawing.SizeF(265.3333F, 63F);
            this.label6.Text = "S? L??ng";
            this.label6.WordWrap = false;
            // 
            // label7
            // 
            this.label7.Borders = ((DevExpress.XtraPrinting.BorderSide)(((DevExpress.XtraPrinting.BorderSide.Left | DevExpress.XtraPrinting.BorderSide.Right) 
            | DevExpress.XtraPrinting.BorderSide.Bottom)));
            this.label7.Dpi = 254F;
            this.label7.LocationFloat = new DevExpress.Utils.PointFloat(1326.667F, 126F);
            this.label7.Name = "label7";
            this.label7.SizeF = new System.Drawing.SizeF(265.3333F, 63F);
            this.label7.Text = "V? Trí";
            this.label7.WordWrap = false;
            // 
            // label8
            // 
            this.label8.Borders = ((DevExpress.XtraPrinting.BorderSide)((DevExpress.XtraPrinting.BorderSide.Left | DevExpress.XtraPrinting.BorderSide.Bottom)));
            this.label8.Dpi = 254F;
            this.label8.ExpressionBindings.AddRange(new DevExpress.XtraReports.UI.ExpressionBinding[] {
            new DevExpress.XtraReports.UI.ExpressionBinding("BeforePrint", "Text", "[MaSp]")});
            this.label8.ForeColor = System.Drawing.Color.FromArgb(((int)(((byte)(0)))), ((int)(((byte)(0)))), ((int)(((byte)(0)))));
            this.label8.LocationFloat = new DevExpress.Utils.PointFloat(0F, 0F);
            this.label8.Name = "label8";
            this.label8.Padding = new DevExpress.XtraPrinting.PaddingInfo(11, 11, 0, 0, 254F);
            this.label8.SizeF = new System.Drawing.SizeF(265.3333F, 63F);
            this.label8.TextAlignment = DevExpress.XtraPrinting.TextAlignment.MiddleLeft;
            this.label8.WordWrap = false;
            // 
            // label9
            // 
            this.label9.Borders = ((DevExpress.XtraPrinting.BorderSide)((DevExpress.XtraPrinting.BorderSide.Left | DevExpress.XtraPrinting.BorderSide.Bottom)));
            this.label9.Dpi = 254F;
            this.label9.ExpressionBindings.AddRange(new DevExpress.XtraReports.UI.ExpressionBinding[] {
            new DevExpress.XtraReports.UI.ExpressionBinding("BeforePrint", "Text", "[TenSp]")});
            this.label9.ForeColor = System.Drawing.Color.FromArgb(((int)(((byte)(0)))), ((int)(((byte)(0)))), ((int)(((byte)(0)))));
            this.label9.LocationFloat = new DevExpress.Utils.PointFloat(265.3333F, 0F);
            this.label9.Name = "label9";
            this.label9.Padding = new DevExpress.XtraPrinting.PaddingInfo(11, 11, 0, 0, 254F);
            this.label9.SizeF = new System.Drawing.SizeF(265.3333F, 63F);
            this.label9.TextAlignment = DevExpress.XtraPrinting.TextAlignment.MiddleLeft;
            this.label9.WordWrap = false;
            // 
            // label10
            // 
            this.label10.Borders = ((DevExpress.XtraPrinting.BorderSide)((DevExpress.XtraPrinting.BorderSide.Left | DevExpress.XtraPrinting.BorderSide.Bottom)));
            this.label10.Dpi = 254F;
            this.label10.ExpressionBindings.AddRange(new DevExpress.XtraReports.UI.ExpressionBinding[] {
            new DevExpress.XtraReports.UI.ExpressionBinding("BeforePrint", "Text", "[Maker]")});
            this.label10.ForeColor = System.Drawing.Color.FromArgb(((int)(((byte)(0)))), ((int)(((byte)(0)))), ((int)(((byte)(0)))));
            this.label10.LocationFloat = new DevExpress.Utils.PointFloat(530.6667F, 0F);
            this.label10.Name = "label10";
            this.label10.Padding = new DevExpress.XtraPrinting.PaddingInfo(11, 11, 0, 0, 254F);
            this.label10.SizeF = new System.Drawing.SizeF(265.3333F, 63F);
            this.label10.TextAlignment = DevExpress.XtraPrinting.TextAlignment.MiddleCenter;
            this.label10.WordWrap = false;
            // 
            // label11
            // 
            this.label11.Borders = ((DevExpress.XtraPrinting.BorderSide)((DevExpress.XtraPrinting.BorderSide.Left | DevExpress.XtraPrinting.BorderSide.Bottom)));
            this.label11.Dpi = 254F;
            this.label11.ExpressionBindings.AddRange(new DevExpress.XtraReports.UI.ExpressionBinding[] {
            new DevExpress.XtraReports.UI.ExpressionBinding("BeforePrint", "Text", "[DonViTinh]")});
            this.label11.ForeColor = System.Drawing.Color.FromArgb(((int)(((byte)(0)))), ((int)(((byte)(0)))), ((int)(((byte)(0)))));
            this.label11.LocationFloat = new DevExpress.Utils.PointFloat(796F, 0F);
            this.label11.Name = "label11";
            this.label11.Padding = new DevExpress.XtraPrinting.PaddingInfo(11, 11, 0, 0, 254F);
            this.label11.SizeF = new System.Drawing.SizeF(265.3333F, 63F);
            this.label11.TextAlignment = DevExpress.XtraPrinting.TextAlignment.MiddleCenter;
            this.label11.WordWrap = false;
            // 
            // label12
            // 
            this.label12.Borders = ((DevExpress.XtraPrinting.BorderSide)((DevExpress.XtraPrinting.BorderSide.Left | DevExpress.XtraPrinting.BorderSide.Bottom)));
            this.label12.Dpi = 254F;
            this.label12.ExpressionBindings.AddRange(new DevExpress.XtraReports.UI.ExpressionBinding[] {
            new DevExpress.XtraReports.UI.ExpressionBinding("BeforePrint", "Text", "[SoLuong]")});
            this.label12.ForeColor = System.Drawing.Color.FromArgb(((int)(((byte)(0)))), ((int)(((byte)(0)))), ((int)(((byte)(0)))));
            this.label12.LocationFloat = new DevExpress.Utils.PointFloat(1061.333F, 0F);
            this.label12.Name = "label12";
            this.label12.Padding = new DevExpress.XtraPrinting.PaddingInfo(11, 11, 0, 0, 254F);
            this.label12.SizeF = new System.Drawing.SizeF(265.3333F, 63F);
            this.label12.TextAlignment = DevExpress.XtraPrinting.TextAlignment.MiddleCenter;
            this.label12.WordWrap = false;
            // 
            // label13
            // 
            this.label13.Borders = ((DevExpress.XtraPrinting.BorderSide)(((DevExpress.XtraPrinting.BorderSide.Left | DevExpress.XtraPrinting.BorderSide.Right) 
            | DevExpress.XtraPrinting.BorderSide.Bottom)));
            this.label13.Dpi = 254F;
            this.label13.ExpressionBindings.AddRange(new DevExpress.XtraReports.UI.ExpressionBinding[] {
            new DevExpress.XtraReports.UI.ExpressionBinding("BeforePrint", "Text", "[ViTriO]")});
            this.label13.ForeColor = System.Drawing.Color.FromArgb(((int)(((byte)(0)))), ((int)(((byte)(0)))), ((int)(((byte)(0)))));
            this.label13.LocationFloat = new DevExpress.Utils.PointFloat(1326.667F, 0F);
            this.label13.Name = "label13";
            this.label13.Padding = new DevExpress.XtraPrinting.PaddingInfo(11, 11, 0, 0, 254F);
            this.label13.SizeF = new System.Drawing.SizeF(265.3333F, 63F);
            this.label13.TextAlignment = DevExpress.XtraPrinting.TextAlignment.MiddleCenter;
            this.label13.WordWrap = false;
            // 
            // label14
            // 
            this.label14.Borders = ((DevExpress.XtraPrinting.BorderSide)((DevExpress.XtraPrinting.BorderSide.Left | DevExpress.XtraPrinting.BorderSide.Bottom)));
            this.label14.Dpi = 254F;
            this.label14.LocationFloat = new DevExpress.Utils.PointFloat(0F, 0F);
            this.label14.Name = "label14";
            this.label14.SizeF = new System.Drawing.SizeF(265.3333F, 63F);
            this.label14.WordWrap = false;
            // 
            // label15
            // 
            this.label15.Borders = ((DevExpress.XtraPrinting.BorderSide)((DevExpress.XtraPrinting.BorderSide.Left | DevExpress.XtraPrinting.BorderSide.Bottom)));
            this.label15.Dpi = 254F;
            this.label15.ExpressionBindings.AddRange(new DevExpress.XtraReports.UI.ExpressionBinding[] {
            new DevExpress.XtraReports.UI.ExpressionBinding("BeforePrint", "Text", "sumCount([TenSp])")});
            this.label15.LocationFloat = new DevExpress.Utils.PointFloat(265.3333F, 0F);
            this.label15.Name = "label15";
            this.label15.SizeF = new System.Drawing.SizeF(265.3333F, 63F);
            xrSummary1.IgnoreNullValues = true;
            xrSummary1.Running = DevExpress.XtraReports.UI.SummaryRunning.Report;
            this.label15.Summary = xrSummary1;
            this.label15.TextFormatString = "{0}";
            this.label15.WordWrap = false;
            // 
            // label16
            // 
            this.label16.Borders = ((DevExpress.XtraPrinting.BorderSide)((DevExpress.XtraPrinting.BorderSide.Left | DevExpress.XtraPrinting.BorderSide.Bottom)));
            this.label16.Dpi = 254F;
            this.label16.LocationFloat = new DevExpress.Utils.PointFloat(530.6667F, 0F);
            this.label16.Name = "label16";
            this.label16.SizeF = new System.Drawing.SizeF(265.3333F, 63F);
            this.label16.WordWrap = false;
            // 
            // label17
            // 
            this.label17.Borders = ((DevExpress.XtraPrinting.BorderSide)((DevExpress.XtraPrinting.BorderSide.Left | DevExpress.XtraPrinting.BorderSide.Bottom)));
            this.label17.Dpi = 254F;
            this.label17.LocationFloat = new DevExpress.Utils.PointFloat(796F, 0F);
            this.label17.Name = "label17";
            this.label17.SizeF = new System.Drawing.SizeF(265.3333F, 63F);
            this.label17.WordWrap = false;
            // 
            // label18
            // 
            this.label18.Borders = ((DevExpress.XtraPrinting.BorderSide)((DevExpress.XtraPrinting.BorderSide.Left | DevExpress.XtraPrinting.BorderSide.Bottom)));
            this.label18.Dpi = 254F;
            this.label18.ExpressionBindings.AddRange(new DevExpress.XtraReports.UI.ExpressionBinding[] {
            new DevExpress.XtraReports.UI.ExpressionBinding("BeforePrint", "Text", "sumSum([SoLuong])")});
            this.label18.LocationFloat = new DevExpress.Utils.PointFloat(1061.333F, 0F);
            this.label18.Name = "label18";
            this.label18.SizeF = new System.Drawing.SizeF(265.3333F, 63F);
            xrSummary2.IgnoreNullValues = true;
            xrSummary2.Running = DevExpress.XtraReports.UI.SummaryRunning.Report;
            this.label18.Summary = xrSummary2;
            this.label18.TextFormatString = "{0}";
            this.label18.WordWrap = false;
            // 
            // label19
            // 
            this.label19.Borders = ((DevExpress.XtraPrinting.BorderSide)(((DevExpress.XtraPrinting.BorderSide.Left | DevExpress.XtraPrinting.BorderSide.Right) 
            | DevExpress.XtraPrinting.BorderSide.Bottom)));
            this.label19.Dpi = 254F;
            this.label19.LocationFloat = new DevExpress.Utils.PointFloat(1326.667F, 0F);
            this.label19.Name = "label19";
            this.label19.SizeF = new System.Drawing.SizeF(265.3333F, 63F);
            this.label19.WordWrap = false;
            // 
            // ReportHeaderBandStyle
            // 
            this.ReportHeaderBandStyle.BackColor = System.Drawing.Color.FromArgb(((int)(((byte)(169)))), ((int)(((byte)(208)))), ((int)(((byte)(142)))));
            this.ReportHeaderBandStyle.Font = new System.Drawing.Font("Segoe UI", 11.25F, System.Drawing.FontStyle.Bold);
            this.ReportHeaderBandStyle.ForeColor = System.Drawing.Color.Black;
            this.ReportHeaderBandStyle.Name = "ReportHeaderBandStyle";
            this.ReportHeaderBandStyle.Padding = new DevExpress.XtraPrinting.PaddingInfo(4, 4, 0, 0, 100F);
            this.ReportHeaderBandStyle.TextAlignment = DevExpress.XtraPrinting.TextAlignment.MiddleLeft;
            // 
            // ReportGroupHeaderBandStyle
            // 
            this.ReportGroupHeaderBandStyle.BackColor = System.Drawing.Color.FromArgb(((int)(((byte)(206)))), ((int)(((byte)(206)))), ((int)(((byte)(206)))));
            this.ReportGroupHeaderBandStyle.Name = "ReportGroupHeaderBandStyle";
            this.ReportGroupHeaderBandStyle.Padding = new DevExpress.XtraPrinting.PaddingInfo(4, 0, 0, 0, 100F);
            this.ReportGroupHeaderBandStyle.TextAlignment = DevExpress.XtraPrinting.TextAlignment.MiddleLeft;
            // 
            // ReportDetailBandStyle
            // 
            this.ReportDetailBandStyle.Name = "ReportDetailBandStyle";
            this.ReportDetailBandStyle.Padding = new DevExpress.XtraPrinting.PaddingInfo(4, 4, 0, 0, 100F);
            this.ReportDetailBandStyle.TextAlignment = DevExpress.XtraPrinting.TextAlignment.MiddleLeft;
            // 
            // ReportGroupFooterBandStyle
            // 
            this.ReportGroupFooterBandStyle.BackColor = System.Drawing.Color.FromArgb(((int)(((byte)(192)))), ((int)(((byte)(192)))), ((int)(((byte)(192)))));
            this.ReportGroupFooterBandStyle.Font = new System.Drawing.Font("Verdana", 11.25F, System.Drawing.FontStyle.Bold);
            this.ReportGroupFooterBandStyle.ForeColor = System.Drawing.Color.FromArgb(((int)(((byte)(0)))), ((int)(((byte)(0)))), ((int)(((byte)(0)))));
            this.ReportGroupFooterBandStyle.Name = "ReportGroupFooterBandStyle";
            this.ReportGroupFooterBandStyle.Padding = new DevExpress.XtraPrinting.PaddingInfo(4, 4, 0, 0, 100F);
            this.ReportGroupFooterBandStyle.TextAlignment = DevExpress.XtraPrinting.TextAlignment.MiddleCenter;
            // 
            // ReportFooterBandStyle
            // 
            this.ReportFooterBandStyle.BackColor = System.Drawing.Color.FromArgb(((int)(((byte)(206)))), ((int)(((byte)(206)))), ((int)(((byte)(206)))));
            this.ReportFooterBandStyle.Font = new System.Drawing.Font("Segoe UI", 9.75F, System.Drawing.FontStyle.Bold);
            this.ReportFooterBandStyle.ForeColor = System.Drawing.Color.FromArgb(((int)(((byte)(0)))), ((int)(((byte)(0)))), ((int)(((byte)(0)))));
            this.ReportFooterBandStyle.Name = "ReportFooterBandStyle";
            this.ReportFooterBandStyle.Padding = new DevExpress.XtraPrinting.PaddingInfo(4, 4, 0, 0, 100F);
            this.ReportFooterBandStyle.TextAlignment = DevExpress.XtraPrinting.TextAlignment.MiddleCenter;
            // 
            // ReportOddStyle
            // 
            this.ReportOddStyle.BackColor = System.Drawing.Color.FromArgb(((int)(((byte)(220)))), ((int)(((byte)(220)))), ((int)(((byte)(220)))));
            this.ReportOddStyle.Name = "ReportOddStyle";
            this.ReportOddStyle.Padding = new DevExpress.XtraPrinting.PaddingInfo(4, 4, 0, 0, 100F);
            this.ReportOddStyle.TextAlignment = DevExpress.XtraPrinting.TextAlignment.MiddleLeft;
            // 
            // ReportEvenStyle
            // 
            this.ReportEvenStyle.BackColor = System.Drawing.Color.FromArgb(((int)(((byte)(255)))), ((int)(((byte)(255)))), ((int)(((byte)(255)))));
            this.ReportEvenStyle.Name = "ReportEvenStyle";
            this.ReportEvenStyle.Padding = new DevExpress.XtraPrinting.PaddingInfo(4, 4, 0, 0, 100F);
            this.ReportEvenStyle.TextAlignment = DevExpress.XtraPrinting.TextAlignment.MiddleLeft;
            // 
            // MyReport
            // 
            this.Bands.AddRange(new DevExpress.XtraReports.UI.Band[] {
            this.TopMargin,
            this.PageHeader,
            this.Detail,
            this.ReportFooter,
            this.BottomMargin});
            this.Dpi = 254F;
            this.Margins = new System.Drawing.Printing.Margins(254, 254, 100, 100);
            this.PageHeight = 2970;
            this.PageWidth = 2100;
            this.PaperKind = System.Drawing.Printing.PaperKind.A4;
            this.ReportUnit = DevExpress.XtraReports.UI.ReportUnit.TenthsOfAMillimeter;
            this.SnapGridSize = 25F;
            this.StyleSheet.AddRange(new DevExpress.XtraReports.UI.XRControlStyle[] {
            this.ReportHeaderBandStyle,
            this.ReportGroupHeaderBandStyle,
            this.ReportDetailBandStyle,
            this.ReportGroupFooterBandStyle,
            this.ReportFooterBandStyle,
            this.ReportOddStyle,
            this.ReportEvenStyle});
            this.StyleSheetPath = "";
            this.Version = "19.2";
            ((System.ComponentModel.ISupportInitialize)(this)).EndInit();

        }
    }
}