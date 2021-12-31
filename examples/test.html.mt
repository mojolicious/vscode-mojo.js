<!DOCTYPE html>
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
  %#  just
  <body>
    <header>
      %= contentFor('header')
    </header>
    <div>
      <div>
        <main>
          %= content
        </main>
      </div>
    </div>
    % const test = 'foo';
    <footer>
      <div>
        <%=
          test
        %>
      </div>
    </footer>
  </body>
</html>
