    <listtemplate name="projects"></listtemplate>

	<if @user_space_p@ eq 1>
  <a href="?page_num=@page_num@&is_observer_p=f" class="button">#project-manager-portlet.my_projects#</a> |
  <a href="?page_num=@page_num@&is_observer_p=t" class="button">#project-manager-portlet.pool_projects#</a>
</if>
<if @is_observer_p@ not nil>
	<small><a href="?page_num=@page_num@">(#project-manager-portlet.clear#)</a></small>
</if>
  
   <br>
   <center>
   <if @more_p@ eq 1>
	<if @user_space_p@ eq 1>
            <a href="project-manager/index?user_space_p=1&is_observer_p=f" class="button">#project-manager-portlet.More#</a>
	</if>
	<else>
  	    <a href="project-manager/index" class="button">#project-manager-portlet.More#</a>
        </else>
   </if>
   <center>
   <br>	