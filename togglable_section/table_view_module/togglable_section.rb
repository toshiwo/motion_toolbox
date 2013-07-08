module TableViewModule
  module TogglableSection

    def tableView table_view, viewForHeaderInSection:section
      return TogglableTableHeaderView.new
    end

    def tableView table_view, heightForRowAtIndexPath:index_path
      0.0
    end

  end
end
