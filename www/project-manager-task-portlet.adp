<include src="/packages/project-manager/lib/tasks" 
	filter_party_id="@filter_party_id@" 
	base_url="@base_url@" 
	instance_id="@pm_package_id@"
	display_mode="list" 
	fmt="@fmt@" 
	elements="@elements@" 
	watcher_p="@watcher_p@" 
	page_num="@page_num@" 
	is_observer_filter="@is_observer_filter@"
	status_id="1"
	orderby_p="0"
	tasks_portlet_p="t">

<br>
<a href="?page_num=@page_num@&is_observer_filter=f&filter_party_id=@user_id@" class="button">#project-manager-portlet.my_tasks#</a> |
<a href="?page_num=@page_num@&is_observer_filter=" class="button">#project-manager-portlet.pool_tasks#</a>
<br><br>
