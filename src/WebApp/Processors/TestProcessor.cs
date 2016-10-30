using System;
using Sitecore.Pipelines.HttpRequest;

namespace WebApp.Processors
{
    public class TestProcessor : HttpRequestProcessor
    {
        public override void Process(HttpRequestArgs args)
        {
            args.Context.Response.Write($"<h1>Hello: {Environment.MachineName}</h1>");
        }
    }
}