   <multiple name=pm_packages>    
    <if @filter_p@ ne 0>
        <form method=post name=search action=index>
          <b>#project-manager.Search#</b><br />
          <input type=text name=searchterm value="@searchterm@" size="15" />
          @hidden_vars;noquote@
	  <br> <br>
          <b>#project-manager.planned_end_date_between#</b><br />
	  #project-manager.Start_date#:
          <input type=text name="start_range_f" value="@start_range_f@" id="sel1" size="10"/>
          <input type='reset' value='...' onclick="return showCalendar('sel1', 'y-m-d');">
	  & #project-manager.End_date#:
          <input type=text name="end_range_f" value="@end_range_f@" id="sel2" size="10"/>
          <input type='reset' value='...' onclick="return showCalendar('sel2', 'y-m-d');"> [<b>YYYY-MM-DD</b>]
          <input type="submit" value="Go" />
        </form>
        @category_select;noquote@
    </if>
    <listtemplate name="@pm_packages.list_id@"></listtemplate>
   </multiple>
  
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