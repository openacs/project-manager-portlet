<%

    #
    #  Copyright (C) 2005 Cognovis
    #  Author: Bjoern Kiesbye (kiesbye@theservice.de)     
    #

    #  This file is part of dotLRN.
    #
    #  dotLRN is free software; you can redistribute it and/or modify it under the
    #  terms of the GNU General Public License as published by the Free Software
    #  Foundation; either version 2 of the License, or (at your option) any later
    #  version.
    #
    #  dotLRN is distributed in the hope that it will be useful, but WITHOUT ANY
    #  WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS
    #  FOR A PARTICULAR PURPOSE.  See the GNU General Public License for more
    #  details.
    #

%>



  <link rel="stylesheet" href="style.css" type="text/css" />
      <include src="../lib/projects" category_id=@pass_cat@ orderby=@orderby;noquote@    elements="customer_name planned_end_date category_id" package_id=@project_manager_id@ actions_p="1" bulk_p="1" assignee_id="" filter_p="0" base_url="@base_url@" fmt=@fmt@>
