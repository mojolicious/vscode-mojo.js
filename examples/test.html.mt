<!DOCTYPE html>
%# some comment
% const hello = 'world';
<!-- Request ID: <%= ctx.req.requestId %> -->
<html>
  <head>
    <title>Debug</title>
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
