require_relative '../../../src/data/project'
require_relative '../../../src/data/error'
class ProjectRequest

  def self.create_project(client, method, json)#POST
    end_point = '/projects'
    http_request = client.get_request(method, end_point)
    http_request.body = json

    http_response = client.execute_request(client.get_connection, http_request)
    obj_project = JSON.parse(http_response.body)
    var = DataHelper.rehash_to_symbol_keys(obj_project)
    obj_project = Project.new(var)
    return http_response,obj_project

  end

  def self.create_project_negative(client, method, json)#POST
    end_point = '/projects'
    http_request = client.get_request(method, end_point)
    http_request.body = json

    http_response = client.execute_request(client.get_connection, http_request)
    obj_error = JSON.parse(http_response.body)
    var = DataHelper.rehash_to_symbol_keys(obj_error)
    obj_error = Error.new(var)
    return http_response,obj_error

  end

  def self.delete_project(client, method, id_project)#DELETE
    end_point = '/projects/%s' %id_project
    http_request = client.get_request(method, end_point)
    @http_response = client.execute_request(client.get_connection, http_request)

  end

  def self.get_projects(client, method)#GET
    end_point = '/projects/'
    http_request = client.get_request(method, end_point)
    http_response = client.execute_request(client.get_connection, http_request)
    http_response
  end

  def self.get_project_by_id(client, method, id_project)#GET
    end_point = '/projects/%s/' %id_project
    http_request = client.get_request(method, end_point)
    http_response = client.execute_request(client.get_connection, http_request)
    http_response
  end

  def self.update_project(client, method, id_project, json_text) #POST
    end_point = '/projects/%s/' %id_project
    http_request = client.get_request(method, end_point)
    http_request.body = json_text
    http_response = client.execute_request(client.get_connection, http_request)
    http_response
  end

end