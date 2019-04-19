<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Artists.aspx.cs" Inherits="Artists" MasterPageFile="~/site.master" %>

<asp:Content ID="Content1" ContentPlaceHolderID="mainPlaceholder" runat="server" >
    
    <asp:ListView ID="ListView1" class="listview" runat="server" DataKeyNames="artist_id" DataSourceID="SqlDataSource1" InsertItemPosition="LastItem">
        <AlternatingItemTemplate>
            <tr style="background-color:#FFF8DC;">
                <td>
                    <asp:Button ID="DeleteButton" runat="server" CommandName="Delete" Text="Delete" />
                    <asp:Button ID="EditButton" runat="server" CommandName="Edit" Text="Edit" />
                </td>
                <td>
                    <asp:Label ID="artist_idLabel" runat="server" Text='<%# Eval("artist_id") %>' />
                </td>
                <td>
                    <asp:Label ID="fnameLabel" runat="server" Text='<%# Eval("fname") %>' />
                </td>
                <td>
                    <asp:Label ID="lnameLabel" runat="server" Text='<%# Eval("lname") %>' />
                </td>
                <td>
                    <asp:Label ID="artist_type_idLabel" runat="server" Text='<%# Eval("artist_type_id") %>' />
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
                    <asp:Label ID="artist_idLabel1" runat="server" Text='<%# Eval("artist_id") %>' />
                </td>
                <td>
                    <asp:TextBox ID="fnameTextBox" runat="server" Text='<%# Bind("fname") %>' />
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="fnameTextBox" ErrorMessage="Must have a name." ValidationGroup="Edit"></asp:RequiredFieldValidator>
                <!-- not working -->
                </td>
                <td>
                    <asp:TextBox ID="lnameTextBox" runat="server" Text='<%# Bind("lname") %>' />
                </td>
                <td>
                    <asp:DropDownList runat="server" ID="ddlartist_type_id" DataSourceID="SqlDataSource2" DataTextField="description" DataValueField="artist_type_id" SelectedValue='<%# Bind("artist_type_id") %>'></asp:DropDownList>
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
                    <asp:TextBox ID="fnameTextBox" runat="server" Text='<%# Bind("fname") %>' />
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="fnameTextBox" ErrorMessage="Must have a name." ValidationGroup="Insert"></asp:RequiredFieldValidator>
                </td>
                <td>
                    <asp:TextBox ID="lnameTextBox" runat="server" Text='<%# Bind("lname") %>' />
                </td>
                <td>
                    <asp:DropDownList runat="server" ID="ddlartist_type_id" DataSourceID="SqlDataSource2" DataTextField="description" DataValueField="artist_type_id" SelectedValue='<%# Bind("artist_type_id") %>'></asp:DropDownList>
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
                    <asp:Label ID="artist_idLabel" runat="server" Text='<%# Eval("artist_id") %>' />
                </td>
                <td>
                    <asp:Label ID="fnameLabel" runat="server" Text='<%# Eval("fname") %>' />
                </td>
                <td>
                    <asp:Label ID="lnameLabel" runat="server" Text='<%# Eval("lname") %>' />
                </td>
                <td>
                    <asp:Label ID="artist_type_idLabel" runat="server" Text='<%# Eval("artist_type_id") %>' />
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
                                <th runat="server">artist_id</th>
                                <th runat="server">fname</th>
                                <th runat="server">lname</th>
                                <th runat="server">artist_type_id</th>
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
                    <asp:Label ID="artist_idLabel" runat="server" Text='<%# Eval("artist_id") %>' />
                </td>
                <td>
                    <asp:Label ID="fnameLabel" runat="server" Text='<%# Eval("fname") %>' />
                </td>
                <td>
                    <asp:Label ID="lnameLabel" runat="server" Text='<%# Eval("lname") %>' />
                </td>
                <td>
                    <asp:Label ID="artist_type_idLabel" runat="server" Text='<%# Eval("description") %>' />
                </td>
            </tr>
        </SelectedItemTemplate>
    </asp:ListView>

    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:disk_inventoryccConnectionString %>" 
        DeleteCommand="EXECUTE del_artist @artist_id" 
        InsertCommand="EXECUTE ins_artist @fname, @lname, @artist_type_id" 
        SelectCommand="SELECT * FROM [artist] ORDER BY [lname], [fname]" 
        UpdateCommand="EXECUTE upd_artist @artist_id, @fname, @lname, @artist_type_id">
        <DeleteParameters>
            <asp:Parameter Name="artist_id" Type="Int32" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="fname" Type="String" />
            <asp:Parameter Name="lname" Type="String" />
            <asp:Parameter Name="artist_type_id" Type="Int32" />
        </InsertParameters>
        <UpdateParameters>
            <asp:Parameter Name="fname" Type="String" />
            <asp:Parameter Name="lname" Type="String" />
            <asp:Parameter Name="artist_type_id" Type="Int32" />
            <asp:Parameter Name="artist_id" Type="Int32" />
        </UpdateParameters>
    </asp:SqlDataSource>
    <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:disk_inventoryccConnectionString %>" 
        SelectCommand="SELECT [artist_type_id], [description] FROM [artist_type] ORDER BY [description]"></asp:SqlDataSource>
</asp:Content>
