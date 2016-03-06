<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="cus.aspx.cs" Inherits="cus" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <!-- container -->
	<div class="container">

		<ol class="breadcrumb">
			<li><a href="index.html">Home</a></li>
			<li class="active">About</li>
		</ol>

		<div class="row">
			
			<!-- Article main content -->
			<article class="col-sm-9 maincontent">
                <header class="page-header">
					<h2 class="page-title">List Of Customer</h2>
				</header>
                <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="Customer_ID" DataSourceID="SqlDataSource1" style="margin-top: 0px" Width="100%">
                    <Columns>
                        <asp:BoundField DataField="Customer_ID" HeaderText="Customer_ID" ReadOnly="True" SortExpression="Customer_ID" />
                        <asp:BoundField DataField="Name" HeaderText="Name" SortExpression="Name" />
                        <asp:CommandField HeaderText="Manage" ShowDeleteButton="True" ShowEditButton="True" />
                    </Columns>
                </asp:GridView>
			    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:SaleManageConnectionString %>" DeleteCommand="DELETE FROM [Customer] WHERE [Customer_ID] = @Customer_ID" InsertCommand="INSERT INTO [Customer] ([Customer_ID], [Name]) VALUES (@Customer_ID, @Name)" SelectCommand="SELECT * FROM [Customer]" UpdateCommand="UPDATE [Customer] SET [Name] = @Name WHERE [Customer_ID] = @Customer_ID">
                    <DeleteParameters>
                        <asp:Parameter Name="Customer_ID" Type="String" />
                    </DeleteParameters>
                    <InsertParameters>
                        <asp:Parameter Name="Customer_ID" Type="String" />
                        <asp:Parameter Name="Name" Type="String" />
                    </InsertParameters>
                    <UpdateParameters>
                        <asp:Parameter Name="Name" Type="String" />
                        <asp:Parameter Name="Customer_ID" Type="String" />
                    </UpdateParameters>
                </asp:SqlDataSource>
			</article>
			<!-- /Article -->
			
			<!-- Sidebar -->
			<aside class="col-sm-3 sidebar sidebar-right">

				<div class="widget">
					<h2>Manage</h2>
				</div>
                <asp:FormView ID="FormView1" runat="server" DataKeyNames="Customer_ID" DataSourceID="SqlDataSource1">
                    <EditItemTemplate>
                        Customer_ID:
                        <asp:Label ID="Customer_IDLabel1" runat="server" Text='<%# Eval("Customer_ID") %>' />
                        <br />
                        Name:
                        <asp:TextBox ID="NameTextBox" runat="server" Text='<%# Bind("Name") %>' />
                        <br />
                        <asp:LinkButton ID="UpdateButton" runat="server" CausesValidation="True" CommandName="Update" Text="Update" />
                        &nbsp;<asp:LinkButton ID="UpdateCancelButton" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel" />
                    </EditItemTemplate>
                    <EmptyDataTemplate>
                        <asp:LinkButton ID="NewButton" runat="server" CausesValidation="False" CommandName="New" Text="New" />
                    </EmptyDataTemplate>
                    <InsertItemTemplate>
                        Customer_ID:
                        <asp:TextBox ID="Customer_IDTextBox" runat="server" Text='<%# Bind("Customer_ID") %>' />
                        <br />
                        Name:
                        <asp:TextBox ID="NameTextBox" runat="server" Text='<%# Bind("Name") %>' />
                        <br />
                        <asp:LinkButton ID="InsertButton" runat="server" CausesValidation="True" CommandName="Insert" Text="Insert" />
                        &nbsp;<asp:LinkButton ID="InsertCancelButton" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel" />
                    </InsertItemTemplate>
                    <ItemTemplate>
                        Customer_ID:
                        <asp:Label ID="Customer_IDLabel" runat="server" Text='<%# Eval("Customer_ID") %>' />
                        <br />
                        Name:
                        <asp:Label ID="NameLabel" runat="server" Text='<%# Bind("Name") %>' />
                        <br />
                        <asp:LinkButton ID="EditButton" runat="server" CausesValidation="False" CommandName="Edit" Text="Edit" />
                        &nbsp;<asp:LinkButton ID="DeleteButton" runat="server" CausesValidation="False" CommandName="Delete" Text="Delete" />
                        &nbsp;<asp:LinkButton ID="NewButton" runat="server" CausesValidation="False" CommandName="New" Text="New" />
                    </ItemTemplate>
                </asp:FormView>
			</aside>
			<!-- /Sidebar -->

		</div>
	</div>	<!-- /container -->
	

    	<!-- JavaScript libs are placed at the end of the document so the pages load faster -->
	<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.10.2/jquery.min.js"></script>
	<script src="http://netdna.bootstrapcdn.com/bootstrap/3.0.0/js/bootstrap.min.js"></script>
	<script src="assets/js/headroom.min.js"></script>
	<script src="assets/js/jQuery.headroom.min.js"></script>
	<script src="assets/js/template.js"></script>
		<!-- Custom styles for our template -->
	<link rel="stylesheet" href="assets/css/bootstrap-theme.css" media="screen" >
	<link rel="stylesheet" href="assets/css/main.css">
	
</asp:Content>

