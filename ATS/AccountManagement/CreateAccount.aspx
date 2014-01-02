<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="CreateAccount.aspx.cs" Inherits="ATS.AccountManagement.CreateAccount" %>


<%@ Register assembly="AjaxControlToolkit" namespace="AjaxControlToolkit" tagprefix="asp" %>


<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
    <style type="text/css">
        .style1
        {
            width: 318px;
        }
        .style4
        {
            height: 215px;
        }
        .style7
        {
            width: 151px;
            height: 215px;
        }
        .style8
        {
            height: 34px;
        }
        .style9
        {
            height: 34px;
            width: 151px;
        }
        .style10
        {
            height: 32px;
        }
        .style11
        {
            height: 32px;
            width: 151px;
        }
        .style14
        {
            height: 10px;
        }
        .style15
        {
            height: 10px;
            width: 151px;
        }
        .style16
        {
            height: 68px;
        }
        .style17
        {
            width: 151px;
            height: 68px;
        }
    </style>
    </asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <asp:CreateUserWizard ID="CreateUserWizard1" runat="server" 
        oncreateduser="CreateUserWizard1_CreatedUser" LoginCreatedUser="false">
        <WizardSteps>
            <asp:CreateUserWizardStep runat="server">
                <ContentTemplate>
                    <table>
                        <tr>
                            <td align="center" colspan="3">
                                Enter New Account Information<br />
                            </td>
                        </tr>
                        <tr>
                            <td align="center">
                                &nbsp;
                                <asp:Label ID="UserNameLabel" runat="server" AssociatedControlID="UserName">User Name (Unique):</asp:Label>
                                &nbsp;</td>
                            <td align="center" style="text-align: left">
                                <asp:TextBox ID="UserName" runat="server" MaxLength="20"></asp:TextBox>
                                <asp:TextBoxWatermarkExtender ID="UserName_TextBoxWatermarkExtender" 
                                    runat="server" TargetControlID="UserName" WatermarkText = "Name">
                                </asp:TextBoxWatermarkExtender>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
                                    ControlToValidate="ID" ErrorMessage="ATS Personel ID is required" 
                                    ToolTip="ATS Personnel ID is required" ValidationGroup="CreateUserWizard1">*</asp:RequiredFieldValidator>
                            </td>
                            <td align="center">
                                <asp:Label ID="Label8" runat="server" 
                                    Text="Format: 2 to 20 alphanumberic characters"></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td align="right">
                                <asp:Label ID="Label1" runat="server" Text="ATS Personnel ID:    "></asp:Label>
                            </td>
                            <td>
                                <asp:TextBox ID="ID" runat="server" MaxLength="9" style="text-align: left"></asp:TextBox>
                                <asp:TextBoxWatermarkExtender ID="ID_TextBoxWatermarkExtender" runat="server" 
                                    TargetControlID="ID" WatermarkText="ex.E00000000">
                                </asp:TextBoxWatermarkExtender>
                                *</td>
                            <td>
                                <asp:Label ID="Label7" runat="server" 
                                    Text="Format: Exxxxxxxx"></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td align="right">
                                <asp:Label ID="Label2" runat="server" Text="First Name:"></asp:Label>
                            </td>
                            <td>
                                <asp:TextBox ID="FirstName" runat="server" MaxLength="20"></asp:TextBox>
                                <asp:TextBoxWatermarkExtender ID="FirstName_TextBoxWatermarkExtender" 
                                    runat="server" TargetControlID="FirstName" WatermarkText="First">
                                </asp:TextBoxWatermarkExtender>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" 
                                    ControlToValidate="FirstName" ErrorMessage="First name is required" 
                                    ToolTip="First Name is required" ValidationGroup="CreateUserWizard1">*</asp:RequiredFieldValidator>
                            </td>
                            <td>
                                <asp:Label ID="Label9" runat="server" 
                                    Text="Format: 2 to 20 alphanumberic characters"></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td align="right">
                                <asp:Label ID="Label3" runat="server" Text="Last Name:"></asp:Label>
                            </td>
                            <td>
                                <asp:TextBox ID="LastName" runat="server" MaxLength="20"></asp:TextBox>
                                <asp:TextBoxWatermarkExtender ID="LastName_TextBoxWatermarkExtender" 
                                    runat="server" TargetControlID="LastName" WatermarkText="Last">
                                </asp:TextBoxWatermarkExtender>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" 
                                    ControlToValidate="LastName" ErrorMessage="Last name is required" 
                                    ToolTip="Last Name is required" ValidationGroup="CreateUserWizard1">*</asp:RequiredFieldValidator>
                            </td>
                            <td>
                                <asp:Label ID="Label10" runat="server" 
                                    Text="Format: 2 to 20 alphanumberic characters"></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td align="right">
                                <asp:Label ID="PasswordLabel" runat="server" AssociatedControlID="Password">Password:</asp:Label>
                            </td>
                            <td>
                                <asp:TextBox ID="Password" runat="server" TextMode="Password" MaxLength="20"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="PasswordRequired" runat="server" 
                                    ControlToValidate="Password" ErrorMessage="Password is required." 
                                    ToolTip="Password is required." ValidationGroup="CreateUserWizard1">*</asp:RequiredFieldValidator>
                            </td>
                            <td>
                                <asp:Label ID="Label16" runat="server" 
                                    Text="Format: 2 to 20 alphanumberic characters"></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td align="right">
                                <asp:Label ID="ConfirmPasswordLabel" runat="server" 
                                    AssociatedControlID="ConfirmPassword">Confirm Password:</asp:Label>
                            </td>
                            <td>
                                <asp:TextBox ID="ConfirmPassword" runat="server" TextMode="Password" 
                                    MaxLength="20"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="ConfirmPasswordRequired" runat="server" 
                                    ControlToValidate="ConfirmPassword" 
                                    ErrorMessage="Confirm Password is required." 
                                    ToolTip="Confirm Password is required." ValidationGroup="CreateUserWizard1">*</asp:RequiredFieldValidator>
                            </td>
                            <td>
                                <asp:Label ID="Label17" runat="server" 
                                    Text="Format: 2 to 20 alphanumberic characters"></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td align="right">
                                <asp:Label ID="EmailLabel" runat="server" AssociatedControlID="Email">E-mail:</asp:Label>
                            </td>
                            <td>
                                <asp:TextBox ID="Email" runat="server"></asp:TextBox>
                                <asp:TextBoxWatermarkExtender ID="Email_TextBoxWatermarkExtender" 
                                    runat="server" TargetControlID="Email" WatermarkText = "Email@goldmail.etsu.edu">
                                </asp:TextBoxWatermarkExtender>
                                <asp:RequiredFieldValidator ID="EmailRequired" runat="server" 
                                    ControlToValidate="Email" ErrorMessage="E-mail is required." 
                                    ToolTip="E-mail is required." ValidationGroup="CreateUserWizard1">*</asp:RequiredFieldValidator>
                            </td>
                            <td>
                                <asp:Label ID="Label11" runat="server" Text="Format: John@gmail.com"></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td align="right">
                                <asp:Label ID="Label4" runat="server" Text="Phone Number:"></asp:Label>
                            </td>
                            <td>
                                <asp:TextBox ID="PhoneNumber" runat="server" MaxLength="14"></asp:TextBox>
                                <asp:TextBoxWatermarkExtender ID="PhoneNumber_TextBoxWatermarkExtender" 
                                    runat="server" TargetControlID="PhoneNumber" WatermarkText="(555)555-5555">
                                </asp:TextBoxWatermarkExtender>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" 
                                    ControlToValidate="PhoneNumber" ErrorMessage="Phone number is required" 
                                    ToolTip="Phone Number is required" ValidationGroup="CreateUserWizard1">*</asp:RequiredFieldValidator>
                            </td>
                            <td>
                                <asp:Label ID="Label12" runat="server" Text="Format: (xxx)-xxx-xxxx"></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td align="right">
                                <asp:Label ID="QuestionLabel" runat="server" AssociatedControlID="Question">Security Question:</asp:Label>
                            </td>
                            <td>
                                <asp:TextBox ID="Question" runat="server" MaxLength="20"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="QuestionRequired" runat="server" 
                                    ControlToValidate="Question" ErrorMessage="Security question is required." 
                                    ToolTip="Security question is required." ValidationGroup="CreateUserWizard1">*</asp:RequiredFieldValidator>
                            </td>
                            <td>
                                <asp:Label ID="Label13" runat="server" 
                                    Text="Format: 2 to 20 alphanumberic characters"></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td align="right">
                                <asp:Label ID="AnswerLabel" runat="server" AssociatedControlID="Answer">Security Answer:</asp:Label>
                            </td>
                            <td>
                                <asp:TextBox ID="Answer" runat="server" MaxLength="20"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="AnswerRequired" runat="server" 
                                    ControlToValidate="Answer" ErrorMessage="Security answer is required." 
                                    ToolTip="Security answer is required." ValidationGroup="CreateUserWizard1">*</asp:RequiredFieldValidator>
                            </td>
                            <td>
                                <asp:Label ID="Label14" runat="server" 
                                    Text="Format: 2 to 20 alphanumberic characters"></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td align="right">
                                <asp:RadioButton ID="SuperAdmin" runat="server" GroupName="1" 
                                    oncheckedchanged="SuperAdmin_CheckedChanged" Text="SuperAdmin" />
                            </td>
                            <td>
                                <asp:RadioButton ID="Admin" runat="server" GroupName="1" 
                                    oncheckedchanged="Admin_CheckedChanged" Text="Admin" />
                                <asp:RadioButton ID="ATSPersonnel" runat="server" GroupName="1" 
                                    oncheckedchanged="ATSPersonnel_CheckedChanged" Text="ATSPersonnel" />
                            </td>
                            <td>
                                &nbsp;</td>
                        </tr>
                        <tr>
                            <td align="center" colspan="2">
                                <asp:CompareValidator ID="PasswordCompare" runat="server" 
                                    ControlToCompare="Password" ControlToValidate="ConfirmPassword" 
                                    Display="Dynamic" 
                                    ErrorMessage="The Password and Confirmation Password must match." 
                                    ValidationGroup="CreateUserWizard1"></asp:CompareValidator>
                            </td>
                            <td align="center">
                                &nbsp;</td>
                        </tr>
                        <tr>
                            <td align="center" colspan="2" style="color:Red;">
                                <asp:Literal ID="ErrorMessage" runat="server" EnableViewState="False"></asp:Literal>
                            </td>
                            <td align="center" style="color:Red; margin-left: 40px;">
                                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<asp:Button ID="Button1" runat="server" style="text-align: center" Text="Clear" 
                                    Width="111px" onclick="Button1_Click" CssClass="button" />
                                <asp:Button ID="Button2" runat="server" CssClass="button" Height="41px" 
                                    onclick="Button2_Click" style="margin-left: 2px" Text="Cancel" Width="109px" />
                                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                            </td>
                        </tr>
                        <tr>
                            <td align="center" style="color:Red;">
                                &nbsp;</td>
                            <td align="center" style="color:Red;">
                                &nbsp;</td>
                            <td align="center" style="color:Red;">
                                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;</td>
                        </tr>
                    </table>
                </ContentTemplate>
            </asp:CreateUserWizardStep>
            <asp:CompleteWizardStep runat="server" >
                <ContentTemplate>
                    <table>
                        <tr>
                            <td align="center" class="style16">
                                </td>
                            <td align="center" class="style17">
                            </td>
                            <td align="center" class="style1" rowspan="5">
                                <img src="http://www.etsu.edu/coe/china/ETSU.jpg" />
                            </td>
                        </tr>
                        <tr>
                            <td align="center" class="style4">
                                Complete<br />
                                <br />
                                Your account has been successfully created!<br />
                                <br />
                                <asp:Button ID="ContinueButton" runat="server" CausesValidation="False" 
                                    CommandName="Continue" onclick="ContinueButton_Click" Text="Continue" 
                                    ValidationGroup="CreateUserWizard1" />
                            </td>
                            <td align="center" class="style7">
                                &nbsp;</td>
                        </tr>
                        <tr>
                            <td align="center" class="style14">
                                <br />
                                <br />
                                <br />
                                <br />
                                <br />
                                <br />
                                <br />
                            </td>
                            <td align="center" class="style15">
                            </td>
                        </tr>
                        <tr>
                            <td class="style8">
                                &nbsp;</td>
                            <td class="style9">
                            </td>
                        </tr>
                        <tr>
                            <td align="right" class="style10">
                                &nbsp;</td>
                            <td align="right" class="style11">
                            </td>
                        </tr>
                    </table>
                </ContentTemplate>
            </asp:CompleteWizardStep>
        </WizardSteps>
    </asp:CreateUserWizard>
    <br />
    <br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<br />
    <br />
    <br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    <br />
</asp:Content>
