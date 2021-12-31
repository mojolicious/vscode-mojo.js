<!DOCTYPE html>
%# some comment
% const hello = 'world';
<!-- Request ID: <%= ctx.req.requestId %> -->
<html>
  <head>
    <%

       const yada = 'yada';

    %>
    <title>Debug</title>
    <%%=
      'replace' %>
    %%= 'this'
    <% for (let i = 1; i <= 3; i++) { =%>
      <%= i %>
    <% } =%>
    <%= ctx.mojoFaviconTag() %>
    <script>
      const foo = 23;
      console.log('testing...');
    </script>
  </head>
  <%# this is %>
  %# just
  <%#
   a test
  %>
  <body>
    <header>
      %= contentFor('header')
    </header>
    <div>
      <div>
        <main>
          %== content
        </main>
      </div>
    </div>
    % const test = 'foo';
    <footer>
      <div>
        <%==
          test
        %>
      </div>
    </footer>
  </body>
</html>
