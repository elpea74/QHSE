<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="TestSignature.aspx.cs" Inherits="QHSE.Users.TestSignature" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>digital signature</title>
 <link rel="stylesheet" href="../css/signature-pad.css" />
</head>
<body>
    
    <form id="form1" runat="server" style="width:50%;height:75%">
   <div>
            <asp:Label ID="Literal1" runat="server">Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed eget porttitor neque. Praesent eu luctus nulla. Donec in risus in ligula consectetur rutrum. Nullam porttitor quam non nunc finibus eleifend. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Aliquam nisi eros, rhoncus eu eros ut, vehicula rutrum sapien. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Fusce vitae nibh sit amet mi feugiat iaculis a sit amet nisl. <br />

Suspendisse accumsan massa nec tincidunt eleifend. Mauris eu massa ipsum. Praesent volutpat, urna facilisis faucibus convallis, massa dui dignissim augue, vitae cursus velit arcu ac mauris. Maecenas tellus lacus, interdum non lorem in, consectetur lobortis leo. Nulla sagittis, sapien non aliquam tincidunt, tortor leo porttitor ipsum, in interdum risus est ac leo. Sed condimentum magna a eleifend finibus. Aliquam neque nisl, fermentum ut hendrerit eget, sollicitudin sed felis. Vivamus at aliquam ex. Proin sit amet lorem sed purus pulvinar pulvinar. In malesuada pretium turpis ac pulvinar. <br />

Vestibulum tristique tempus justo sit amet congue. Sed dapibus id libero accumsan dictum. Nulla nunc mauris, dictum tempor elit at, efficitur molestie nulla. Sed ac diam quis arcu blandit vestibulum. Vivamus dictum nunc nec ultrices aliquam. Vestibulum sollicitudin fermentum ipsum eu porttitor. Fusce porttitor dui ut sem fermentum auctor. Aenean eu sapien diam. Nulla sit amet est nec diam efficitur efficitur. Duis varius odio tincidunt, tempor purus quis, sollicitudin ipsum. Maecenas vitae dolor sed ex lacinia imperdiet. Morbi faucibus volutpat sem, fringilla ultricies libero volutpat at. <br />

Suspendisse lobortis et ligula vel luctus. Maecenas vitae efficitur neque, eu ultrices diam. Donec sed luctus sem, eu pellentesque diam. Cras tristique at enim quis semper. Vestibulum ut mollis risus, vel semper libero. Sed tempor nisi et eros eleifend, a convallis metus pretium. Nullam tincidunt, leo nec tincidunt viverra, magna ipsum eleifend nibh, ut vehicula augue turpis eu massa. Quisque ullamcorper ipsum magna, sed aliquet mi volutpat a. Duis lacinia ipsum tortor, vitae fringilla metus consectetur non. Etiam viverra diam a magna semper convallis. Sed bibendum, nisl quis venenatis posuere, magna turpis varius nisi, vitae eleifend mauris odio at augue. Curabitur hendrerit at arcu at aliquet. Etiam lobortis nisi vitae dui efficitur eleifend.</asp:Label>
        </div>
       
        <asp:HiddenField ID="hfimg" runat="server" />
        
       <div id="signature-pad" class="signature-pad" style="height:50%; width:50%">
    <div class="signature-pad--body" style="height:50%">
      <canvas style="height:100%;"></canvas>
    </div>
    <div class="signature-pad--footer" style="height:50%; width:50%">
      <div class="description">Your signature</div>
        <asp:TextBox ID="TextBox1" runat="server" EnableViewState="true"></asp:TextBox>

      <div class="signature-pad--actions">
        <div>
          <button type="button" class="button clear" data-action="clear">Clear</button>
        </div>
        <div>
           <asp:Button ID="Button1" runat="server" Text="Save signature" data-action="save" OnClick="Button1_Click" />           
        </div>
      </div>
    </div>
  </div>
        <asp:HiddenField ID="hfimg2" runat="server" />
         <div id="signature-pad2" class="signature-pad" style="height:50%; width:50%">
    <div class="signature-pad--body" style="height:50%">
      <canvas></canvas>
    </div>
             <div class="signature-pad--footer" style="height:50%; width:50%">
      <div class="description">My signature</div>

      <div class="signature-pad--actions">
        <div>
          <button type="button" class="button clear" data-action="clear">Clear</button>
        </div>
        <div>
           <asp:Button ID="Button2" runat="server" Text="Save signature" data-action="save" OnClick="Button1_Click" />           
        </div>
      </div>
    </div>
  </div>

  <script src="../js/signature_pad.js"></script>
  <script src="../js/app.js"></script>
    </form>
   </body>
    </html>