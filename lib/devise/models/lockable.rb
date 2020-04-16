def valid_for_authentication?
    puts 'mark 1'
    return super unless persisted? && lock_strategy_enabled?(:failed_attempts)
    puts 'mark 2'
  
    # Unlock the user if the lock is expired, no matter
    # if the user can login or not (wrong password, etc)
    unlock_access! if lock_expired?
  
    if super && !access_locked?
      puts 'mark 3 (you should not see me)'
      true
    else
      puts 'mark 4 (you are supposed to see me)'
      self.failed_attempts ||= 0
      self.failed_attempts += 1
      if attempts_exceeded?
        puts 'mark 5 (you should not see me)'
        lock_access! unless access_locked?
      else
        puts 'mark 6 (you are supposed to see me)'
        save(validate: false)
      end
      false
    end
  end