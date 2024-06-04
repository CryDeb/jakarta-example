package org.eclipse.jakarta.hello;

import jakarta.ws.rs.GET;
import jakarta.ws.rs.Path;
import jakarta.ws.rs.Produces;
import jakarta.ws.rs.QueryParam;
import jakarta.ws.rs.core.MediaType;

@Path("secure/hello")
public class HelloWorldSecureResource {

	@GET
	@Produces({ MediaType.APPLICATION_JSON })
	public Hello hello(@QueryParam("name") String name) {
		if ((name == null) || name.trim().isEmpty())  {
			name = "world";
		}

		return new Hello(name);
	}
}