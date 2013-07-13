class TogglableTableHeaderView < UITableViewHeaderFooterView

  def touchesEnded touches, withEvent:event
    touch = touches.allObjects.first
    point = touch.locationInView self.tableView

    if index = detect_touch_section(point)
      self.tableView.delegate.toggle_section index
      self.tableView.reloadData
    end
  end

  def detect_touch_section point
    section_size = self.tableView.dataSource.numberOfSectionsInTableView self.tableView

    section_size.times do |i|
      index = (section_size - i - 1)
      rect = self.tableView.rectForHeaderInSection index

      return index if CGRectContainsPoint rect, point
    end

    nil
  end
  private :detect_touch_section

end
