<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Checkout.aspx.cs" Inherits="Checkout" MasterPageFile="~/site.master" %>

<asp:Content ID="Content1" ContentPlaceHolderID="mainPlaceholder" runat="server" >

        Check Out a Disk to a Borrower:<br />
    <asp:DropDownList ID="DropDownList1" runat="server" DataSourceID="SqlDataSource2" DataTextField="fname" DataValueField="fname">
    </asp:DropDownList>
    
    <asp:DropDownList ID="DropDownList2" runat="server" DataSourceID="SqlDataSource3" DataTextField="disk_name" DataValueField="disk_name">
    </asp:DropDownList>

    <asp:Button ID="Button1" runat="server" Text="Check Out"  OnClick="Button1_Click" />

    <asp:Label ID="lblCheckout" runat="server" Text=""></asp:Label>


    <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:disk_inventoryccConnectionString %>" SelectCommand="SELECT [fname], [lname] FROM [borrower] ORDER BY [fname], [lname]"></asp:SqlDataSource>

    <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:disk_inventoryccConnectionString %>" SelectCommand="SELECT [disk_name], [status_id] FROM [disk] WHERE ([status_id] = @status_id) ORDER BY [disk_name]">
        <SelectParameters>
            <asp:Parameter DefaultValue="1" Name="status_id" Type="Int32" />
        </SelectParameters>
    </asp:SqlDataSource>

        <br />
        <asp:ListView ID="ListView1" runat="server" DataKeyNames="disk_id,borrower_id,borrowed_date" DataSourceID="SqlDataSource1">
            <AlternatingItemTemplate>
                <tr style="background-color:#FFF8DC;">
                    <td>
                        <asp:Label ID="disk_idLabel" runat="server" Text='<%# Eval("disk_id") %>' />
                    </td>
                    <td>
                        <asp:Label ID="borrower_idLabel" runat="server" Text='<%# Eval("borrower_id") %>' />
                    </td>
                    <td>
                        <asp:Label ID="borrowed_dateLabel" runat="server" Text='<%# Eval("borrowed_date") %>' />
                    </td>
                    <td>
                        <asp:Label ID="returned_dateLabel" runat="server" Text='<%# Eval("returned_date") %>' />
                    </td>
                </tr>
            </AlternatingItemTemplate>
            <EditItemTemplate>
                <tr style="background-color:#008A8C;color: #FFFFFF;">
                    <td>
                        <asp:Button ID="UpdateButton" runat="server" CommandName="Update" Text="Update" />
                        <asp:Button ID="CancelButton" runat="server" CommandName="Cancel" Text="Cancel" />
                    </td>
                    <td>
                        <asp:Label ID="disk_idLabel1" runat="server" Text='<%# Eval("disk_id") %>' />
                    </td>
                    <td>
                        <asp:Label ID="borrower_idLabel1" runat="server" Text='<%# Eval("borrower_id") %>' />
                    </td>
                    <td>
                        <asp:Label ID="borrowed_dateLabel1" runat="server" Text='<%# Eval("borrowed_date") %>' />
                    </td>
                    <td>
                        <asp:TextBox ID="returned_dateTextBox" runat="server" Text='<%# Bind("returned_date") %>' />
                    </td>
                </tr>
            </EditItemTemplate>
            <EmptyDataTemplate>
                <table runat="server" style="background-color: #FFFFFF;border-collapse: collapse;border-color: #999999;border-style:none;border-width:1px;">
                    <tr>
                        <td>No data was returned.</td>
                    </tr>
                </table>
            </EmptyDataTemplate>
            <InsertItemTemplate>
                <tr style="">
                    <td>
                        <asp:Button ID="InsertButton" runat="server" CommandName="Insert" Text="Insert" />
                        <asp:Button ID="CancelButton" runat="server" CommandName="Cancel" Text="Clear" />
                    </td>
                    <td>
                        <asp:TextBox ID="disk_idTextBox" runat="server" Text='<%# Bind("disk_id") %>' />
                    </td>
                    <td>
                        <asp:TextBox ID="borrower_idTextBox" runat="server" Text='<%# Bind("borrower_id") %>' />
                    </td>
                    <td>
                        <asp:TextBox ID="borrowed_dateTextBox" runat="server" Text='<%# Bind("borrowed_date") %>' />
                    </td>
                    <td>
                        <asp:TextBox ID="returned_dateTextBox" runat="server" Text='<%# Bind("returned_date") %>' />
                    </td>
                </tr>
            </InsertItemTemplate>
            <ItemTemplate>
                <tr style="background-color:#DCDCDC;color: #000000;">
                    <td>
                        <asp:Label ID="disk_idLabel" runat="server" Text='<%# Eval("disk_id") %>' />
                    </td>
                    <td>
                        <asp:Label ID="borrower_idLabel" runat="server" Text='<%# Eval("borrower_id") %>' />
                    </td>
                    <td>
                        <asp:Label ID="borrowed_dateLabel" runat="server" Text='<%# Eval("borrowed_date") %>' />
                    </td>
                    <td>
                        <asp:Label ID="returned_dateLabel" runat="server" Text='<%# Eval("returned_date") %>' />
                    </td>
                </tr>
            </ItemTemplate>
            <LayoutTemplate>
                <table runat="server">
                    <tr runat="server">
                        <td runat="server">
                            <table id="itemPlaceholderContainer" runat="server" border="1" style="background-color: #FFFFFF;border-collapse: collapse;border-color: #999999;border-style:none;border-width:1px;font-family: Verdana, Arial, Helvetica, sans-serif;">
                                <tr runat="server" style="background-color:#DCDCDC;color: #000000;">
                                    <th runat="server">disk_id</th>
                                    <th runat="server">borrower_id</th>
                                    <th runat="server">borrowed_date</th>
                                    <th runat="server">returned_date</th>
                                </tr>
                                <tr id="itemPlaceholder" runat="server">
                                </tr>
                            </table>
                        </td>
                    </tr>
                    <tr runat="server">
                        <td runat="server" style="text-align: center;background-color: #CCCCCC;font-family: Verdana, Arial, Helvetica, sans-serif;color: #000000;">
                            <asp:DataPager ID="DataPager1" runat="server">
                                <Fields>
                                    <asp:NextPreviousPagerField ButtonType="Button" ShowFirstPageButton="True" ShowLastPageButton="True" />
                                </Fields>
                            </asp:DataPager>
                        </td>
                    </tr>
                </table>
            </LayoutTemplate>
            <SelectedItemTemplate>
                <tr style="background-color:#008A8C;font-weight: bold;color: #FFFFFF;">
                    <td>
                        <asp:Label ID="disk_idLabel" runat="server" Text='<%# Eval("disk_id") %>' />
                    </td>
                    <td>
                        <asp:Label ID="borrower_idLabel" runat="server" Text='<%# Eval("borrower_id") %>' />
                    </td>
                    <td>
                        <asp:Label ID="borrowed_dateLabel" runat="server" Text='<%# Eval("borrowed_date") %>' />
                    </td>
                    <td>
                        <asp:Label ID="returned_dateLabel" runat="server" Text='<%# Eval("returned_date") %>' />
                    </td>
                </tr>
            </SelectedItemTemplate>
        </asp:ListView>
        <br />
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:disk_inventoryccConnectionString %>" SelectCommand="SELECT * FROM [diskHasBorrower] ORDER BY [disk_id]"></asp:SqlDataSource>

</asp:Content>
