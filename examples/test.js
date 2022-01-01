import {mt} from '@mojojs/template';

const test = mt`
<html>
  <head>
    <title><%= title %></title>
  </head>
  <body>
    %== content
  </body>
</html>
`;
