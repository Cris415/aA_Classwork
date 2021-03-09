require 'rack'

app = Proc.new do |env|
  req = Rack::Request.new(env)
  res = Rack::Response.new
  res['Content-Type'] = 'text/html'
  if req.path == "/hello/word/cool"
    res.write("hello world cool")
  else
    res.write("path does not match secret path #{req.path}")
  end
  res.finish
end

Rack::Server.start(
  app:app,
  Port: 3000
)