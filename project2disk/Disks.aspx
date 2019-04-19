<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Disks.aspx.cs" Inherits="Disks" MasterPageFile="~/site.master" %>

<asp:Content ID="Content1" ContentPlaceHolderID="mainPlaceholder" runat="server" >

    <asp:ListView ID="ListView1" class="listview" runat="server" DataKeyNames="disk_id" DataSourceID="SqlDataSource1" InsertItemPosition="LastItem">
        <AlternatingItemTemplate>
            <tr style="background-color:#FFF8DC;">
                <td>
                    <asp:Button ID="DeleteButton" runat="server" CommandName="Delete" Text="Delete" />
                    <asp:Button ID="EditButton" runat="server" CommandName="Edit" Text="Edit" />
                </td>
                <td>
                    <asp:Label ID="disk_idLabel" runat="server" Text='<%# Eval("disk_id") %>' />
                </td>
                <td>
                    <asp:Label ID="disk_nameLabel" runat="server" Text='<%# Eval("disk_name") %>' />
                </td>
                <td>
                    <asp:Label ID="release_dateLabel" runat="server" Text='<%# Eval("release_date") %>' />
                </td>
                <td>
                    <asp:Label ID="genre_idLabel" runat="server" Text='<%# Eval("genre_id") %>' />
                </td>
                <td>
                    <asp:Label ID="status_idLabel" runat="server" Text='<%# Eval("status_id") %>' />
                </td>
                <td>
                    <asp:Label ID="disk_type_idLabel" runat="server" Text='<%# Eval("disk_type_id") %>' />
                </td>
            </tr>
        </AlternatingItemTemplate>
        <EditItemTemplate>
            <tr style="background-color:#008A8C;color: #FFFFFF;">
                <td>
                    <asp:Button ID="UpdateButton" runat="server" CommandName="Update" Text="Update" ValidationGroup="Edit" />
                    <asp:Button ID="CancelButton" runat="server" CommandName="Cancel" Text="Cancel" />
                </td>
                <td>
                    <asp:Label ID="disk_idLabel1" runat="server" Text='<%# Eval("disk_id") %>' />
                </td>
                <td>
                    <asp:TextBox ID="disk_nameTextBox" runat="server" Text='<%# Bind("disk_name") %>' />
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="disk_nameTextBox" ErrorMessage="Enter a name." ValidationGroup="Edit"></asp:RequiredFieldValidator>
                </td>
                <td>
                    <asp:TextBox ID="release_dateTextBox" runat="server" Text='<%# Bind("release_date") %>' />
                    <asp:CompareValidator ID="CompareValidator1" runat="server" ControlToValidate="release_dateTextBox" ErrorMessage="Enter a valid date (remove time before updating)." Type="Date" Operator="DataTypeCheck" ValidationGroup="Edit"></asp:CompareValidator>
                </td>
                <td>
                    <asp:DropDownList runat="server" ID="ddlgenre_id" DataSourceID="SqlDataSource2" DataTextField="genre_id" DataValueField="genre_id" SelectedValue='<%# Bind("genre_id") %>'></asp:DropDownList>
                </td>
                <td>
                    <asp:DropDownList runat="server" ID="DropDownList1" DataSourceID="SqlDataSource2" DataTextField="status_id" DataValueField="status_id" SelectedValue='<%# Bind("status_id") %>'></asp:DropDownList>
                </td>
                <td>
                    <asp:DropDownList runat="server" ID="DropDownList2" DataSourceID="SqlDataSource2" DataTextField="disk_type_id" DataValueField="disk_type_id" SelectedValue='<%# Bind("disk_type_id") %>'></asp:DropDownList>
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
                    <asp:Button ID="InsertButton" runat="server" CommandName="Insert" Text="Insert" ValidationGroup="Insert" />
                    <asp:Button ID="CancelButton" runat="server" CommandName="Cancel" Text="Clear" />
                </td>
                <td>&nbsp;</td>
                <td>
                    <asp:TextBox ID="disk_nameTextBox" runat="server" Text='<%# Bind("disk_name") %>' />
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="disk_nameTextBox" ErrorMessage="Enter a name." ValidationGroup="Insert"></asp:RequiredFieldValidator>
                </td>
                <td>
                    <asp:TextBox ID="release_dateTextBox" runat="server" Text='<%# Bind("release_date") %>' />
                    <asp:CompareValidator ID="CompareValidator1" runat="server" ControlToValidate="release_dateTextBox" ErrorMessage="Enter a valid date." Type="Date" Operator="DataTypeCheck" ValidationGroup="Insert"></asp:CompareValidator>
                </td>
                <td>
                    <!--<asp:TextBox ID="genre_idTextBox" runat="server" Text='<%# Bind("genre_id") %>' />-->
                    <asp:DropDownList runat="server" ID="ddlgenre_id" DataSourceID="SqlDataSource2" DataTextField="genre_id" DataValueField="genre_id" SelectedValue='<%# Bind("genre_id") %>'></asp:DropDownList>
                </td>
                <td>
                    <!--<asp:TextBox ID="status_idTextBox" runat="server" Text='<%# Bind("status_id") %>' />-->
                    <asp:DropDownList runat="server" ID="DropDownList1" DataSourceID="SqlDataSource2" DataTextField="status_id" DataValueField="status_id" SelectedValue='<%# Bind("status_id") %>'></asp:DropDownList>
                </td>
                <td>
                    <!--<asp:TextBox ID="disk_type_idTextBox" runat="server" Text='<%# Bind("disk_type_id") %>' />-->
                    <asp:DropDownList runat="server" ID="DropDownList2" DataSourceID="SqlDataSource2" DataTextField="disk_type_id" DataValueField="disk_type_id" SelectedValue='<%# Bind("disk_type_id") %>'></asp:DropDownList>
                </td>
            </tr>
        </InsertItemTemplate>
        <ItemTemplate>
            <tr style="background-color:#DCDCDC;color: #000000;">
                <td>
                    <asp:Button ID="DeleteButton" runat="server" CommandName="Delete" Text="Delete" />
                    <asp:Button ID="EditButton" runat="server" CommandName="Edit" Text="Edit" />
                </td>
                <td>
                    <asp:Label ID="disk_idLabel" runat="server" Text='<%# Eval("disk_id") %>' />
                </td>
                <td>
                    <asp:Label ID="disk_nameLabel" runat="server" Text='<%# Eval("disk_name") %>' />
                </td>
                <td>
                    <asp:Label ID="release_dateLabel" runat="server" Text='<%# Eval("release_date") %>' />
                </td>
                <td>
                    <asp:Label ID="genre_idLabel" runat="server" Text='<%# Eval("genre_id") %>' />
                </td>
                <td>
                    <asp:Label ID="status_idLabel" runat="server" Text='<%# Eval("status_id") %>' />
                </td>
                <td>
                    <asp:Label ID="disk_type_idLabel" runat="server" Text='<%# Eval("disk_type_id") %>' />
                </td>
            </tr>
        </ItemTemplate>
        <LayoutTemplate>
            <table runat="server">
                <tr runat="server">
                    <td runat="server">
                        <table id="itemPlaceholderContainer" runat="server" border="1" style="background-color: #FFFFFF;border-collapse: collapse;border-color: #999999;border-style:none;border-width:1px;font-family: Verdana, Arial, Helvetica, sans-serif;">
                            <tr runat="server" style="background-color:#DCDCDC;color: #000000;">
                                <th runat="server"></th>
                                <th runat="server">disk_id</th>
                                <th runat="server">disk_name</th>
                                <th runat="server">release_date</th>
                                <th runat="server">genre_id</th>
                                <th runat="server">status_id</th>
                                <th runat="server">disk_type_id</th>
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
                    <asp:Button ID="DeleteButton" runat="server" CommandName="Delete" Text="Delete" />
                    <asp:Button ID="EditButton" runat="server" CommandName="Edit" Text="Edit" />
                </td>
                <td>
                    <asp:Label ID="disk_idLabel" runat="server" Text='<%# Eval("disk_id") %>' />
                </td>
                <td>
                    <asp:Label ID="disk_nameLabel" runat="server" Text='<%# Eval("disk_name") %>' />
                </td>
                <td>
                    <asp:Label ID="release_dateLabel" runat="server" Text='<%# Eval("release_date") %>' />
                </td>
                <td>
                    <asp:Label ID="genre_idLabel" runat="server" Text='<%# Eval("genre_id") %>' />
                </td>
                <td>
                    <asp:Label ID="status_idLabel" runat="server" Text='<%# Eval("status_id") %>' />
                </td>
                <td>
                    <asp:Label ID="disk_type_idLabel" runat="server" Text='<%# Eval("disk_type_id") %>' />
                </td>
            </tr>
        </SelectedItemTemplate>
    </asp:ListView>

    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:disk_inventoryccConnectionString %>" 
        DeleteCommand="EXECUTE del_disk @disk_id" 
        InsertCommand="EXECUTE ins_disk @disk_name, @release_date, @genre_id, @status_id, @disk_type_id" 
        SelectCommand="SELECT * FROM [disk] ORDER BY [disk_name], [disk_id]" 
        UpdateCommand="EXECUTE upd_disk @disk_id, @disk_name, @release_date, @genre_id, @status_id, @disk_type_id">
        <DeleteParameters>
            <asp:Parameter Name="disk_id" Type="Int32" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="disk_name" Type="String" />
            <asp:Parameter Name="release_date" Type="DateTime" />
            <asp:Parameter Name="genre_id" Type="Int32" />
            <asp:Parameter Name="status_id" Type="Int32" />
            <asp:Parameter Name="disk_type_id" Type="Int32" />
        </InsertParameters>
        <UpdateParameters>
            <asp:Parameter Name="disk_name" Type="String" />
            <asp:Parameter Name="release_date" Type="DateTime" />
            <asp:Parameter Name="genre_id" Type="Int32" />
            <asp:Parameter Name="status_id" Type="Int32" />
            <asp:Parameter Name="disk_type_id" Type="Int32" />
            <asp:Parameter Name="disk_id" Type="Int32" />
        </UpdateParameters>
    </asp:SqlDataSource>
    <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:disk_inventoryccConnectionString %>" SelectCommand="SELECT [genre_id], [status_id], [disk_type_id] FROM [disk]"></asp:SqlDataSource>
</asp:Content>
