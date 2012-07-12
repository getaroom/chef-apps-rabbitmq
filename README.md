Configures RabbitMQ for Apps

Tested on Ubuntu 12.04

# Recipes

## default

Adds vhosts and users based on the apps data bag.

### Example Data Bag Item

```json
{
  "id": "my_app",
  "rabbitmq_role": ["my_app_rabbitmq"],
  "rabbitmq_vhosts": {
    "production": {
      "vhost": "/my_app_production",
      "user": "guest",
      "password": "guest"
    }
  }
}
```

# License and Authors

* Chris Griego (<cgriego@getaroom.com>)
* Morgan Nelson (<mnelson@getaroom.com>)

Copyright 2012, getaroom

Permission is hereby granted, free of charge, to any person obtaining
a copy of this software and associated documentation files (the
"Software"), to deal in the Software without restriction, including
without limitation the rights to use, copy, modify, merge, publish,
distribute, sublicense, and/or sell copies of the Software, and to
permit persons to whom the Software is furnished to do so, subject to
the following conditions:

The above copyright notice and this permission notice shall be
included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND
NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE
LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION
OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION
WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
