<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="emi.aspx.cs" Inherits="EmiCalculatorWebforms.emi" %>

<%@ Register Assembly="System.Web.DataVisualization, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35" Namespace="System.Web.UI.DataVisualization.Charting" TagPrefix="asp" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" />
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
    <link href="content/StyleSheet1.css" rel="stylesheet" />


</head>
<body>
    <form id="form1" runat="server">
        <div class=" main">
            <div class="container">
                <div>
                    <h1>
                        <img src="images/logo.png" />
                        Excel Bank</h1>
                </div>
                <br />
                <h2>Credit Card EMI Calculator</h2>
                <div class=" row" style="border:1px solid;">
                    <div class="col-md-6 border-right border-dark">
                        <h2>Type of EMI</h2>

                        <h5>Transaction Amount</h5>
                        <div class="slidecontainer row">
                            <input runat="server" oninput="loanamt()" type="range" min="1500" max="999999" value="1500" class="slider col-md-6 " id="sld_loanamt" />
                            <p class="col-md-5">
                                <input class="col-md-8" runat="server" onchange="loanamt_rev()" id="txt_loanamt" value="1500" type="text" />
                            </p>
                        </div>
                        <h5>Tenure</h5>
                        <div class="slidecontainer row">

                            <input oninput="tenure()" runat="server" type="range" min="3" max="18" value="3" step="3" class="slider1 col-md-6 " id="sld_tenure" />
                            <asp:DropDownList runat="server" onchange="tenure_rev()" ID="drp_tenure">
                                <asp:ListItem Value="3">3 months</asp:ListItem>
                                <asp:ListItem Value="6">6 months</asp:ListItem>
                                <asp:ListItem Value="9">9 months</asp:ListItem>
                                <asp:ListItem Value="12">12 months</asp:ListItem>
                                <asp:ListItem Value="15">15 months</asp:ListItem>
                                <asp:ListItem Value="18">18 months</asp:ListItem>
                            </asp:DropDownList>
                            <%--<p class="col-md-5">--%> <%--<input class="col-md-8" runat="server" onchange="myfun5()" type="text" value="3 " id="demo1"/> Months</p>--%>
                        </div>

                        <h5>Rate of Intrest Per Annum(%)</h5>
                        <div class="slidecontainer row">
                            <input oninput="interest()" runat="server" type="range" min="1" max="15" value="1" step="0.01" class="slider2 col-md-6 " id="sld_interest" />
                            <p class="col-md-5">
                                <input class="col-md-8" runat="server" onchange="interest_rev()" type="text" value="1" id="txt_interest" /></p>
                        </div>
                        <asp:Button ID="Button1" runat="server" Text="Calculate" class="btn btn-danger" OnClick="Button1_Click" />

                        <div class="row">
                            <p class="col-md-6">Monthly Emi</p>
                            <span>Rs.</span>
                            <asp:Label ID="lbl_monthlyemi" runat="server"></asp:Label>
                        </div>
                        <div class="row">
                            <p class="col-md-6">Total Interest Amount</p>
                            <span>Rs.</span>
                            <asp:Label ID="lbl_totalinterestamt" runat="server"></asp:Label>
                        </div>
                        <div class="row">
                            <p class="col-md-6">Total Amount Payable</p>
                            <span>Rs.</span>
                            <asp:Label ID="lbl_totalamountpayable" runat="server"></asp:Label>
                        </div>
                        <p class="note"  style="font-size: 13px; margin-bottom: 0;">Note:- Loan principal amount should not be greater than the Credit Limit of the Card.</p>
                    </div>

                    <div class="col-md-6">

                        <div class="table-responsive">
                            <h3>Amount and Interest</h3>
                            <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
                            <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                                <ContentTemplate>
                                    <asp:RadioButtonList ID="RadioButtonList1" AutoPostBack="True" RepeatDirection="Horizontal" runat="server" OnSelectedIndexChanged="RadioButtonList1_SelectedIndexChanged">
                                        <asp:ListItem Selected="True">Table </asp:ListItem>
                                        <asp:ListItem>Graph</asp:ListItem>
                                    </asp:RadioButtonList>
                                    <div id="emitable" runat="server">


                                        <asp:GridView ID="GridView1" runat="server">
                                            <Columns>
                                            </Columns>
                                        </asp:GridView>

                                    </div>

                                    <div id="emigraph" runat="server">
                                        <asp:Chart ID="Chart1" runat="server" Width="487px">
                                            <Series>
                                                <asp:Series Name="Series1" YValuesPerPoint="6">
                                                    <Points>
                                                        <asp:DataPoint AxisLabel="3" YValues="20000,0,0,0,0,0" />
                                                        <asp:DataPoint AxisLabel="6" YValues="16000,0,0,0,0,0" />
                                                        <asp:DataPoint AxisLabel="9" YValues="12000,0,0,0,0,0" />
                                                        <asp:DataPoint AxisLabel="12" YValues="8000,0,0,0,0,0" />
                                                        <asp:DataPoint AxisLabel="15" YValues="4000,0,0,0,0,0" />
                                                        <asp:DataPoint AxisLabel="18" YValues="0,0,0,0,0,0" />
                                                    </Points>
                                                </asp:Series>
                                            </Series>
                                            <ChartAreas>
                                                <asp:ChartArea Name="ChartArea1">
                                                    <AxisX Title="MONTHS"></AxisX>
                                                    <AxisY Title="BALANCE"></AxisY>
                                                </asp:ChartArea>
                                            </ChartAreas>
                                        </asp:Chart>
                                    </div>
                                </ContentTemplate>
                            </asp:UpdatePanel>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </form>
</body>
<script src="script/JavaScript.js"></script>
</html>
