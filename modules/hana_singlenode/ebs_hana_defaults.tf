locals {
  #type list(string)
  hana_data_device_names = ["/dev/sdi", "/dev/sdj", "/dev/sdk", "/dev/sdl", "/dev/sdm", "/dev/sdn"]
  #type list(string)
  hana_log_device_names  = ["/dev/sdo", "/dev/sdp"]
  #type map
  hana_shared = {
    "u-24tb1.metal" = 1024
    "u-18tb1.metal" = 1024
    "u-12tb1.metal" = 1024
    "u-9tb1.metal" = 1024
    "u-6tb1.metal" = 1024
    "x1e.32xlarge" = 1024
    "x1.32xlarge" = 1024
    "x1.32xlarge" = 1024
    "r5.metal" = 1024
    "r5.24xlarge" = 1024
    "r5.16xlarge" = 512
    "r4.16xlarge" = 512
    "r5.12xlarge" = 512
    "r5.8xlarge" = 300
    "r4.8xlarge" = 300
    "r3.8xlarge" = 300
    "x1e.4xlarge" = 512
    "x1e.2xlarge" = 300
    "x1e.xlarge" = 300
    "r5.4xlarge" = 300
    "r5.2xlarge" = 300
    "r4.4xlarge" = 300
    "r3.4xlarge" = 300
    "r4.2xlarge" = 300
    "r3.2xlarge" = 300
  }
  #type map(map(object({ amount = number, disk_size = number })))
  hana_data = {
    "u-24tb1.metal" = {
      "gp2" = {
        amount   = 6,
        disk_size = 4800
      },
     "io1" = {
        amount   = 6,
        disk_size = 4800
      }
    }
    "u-18tb1.metal" = {
      "gp2" = {
        amount   = 6,
        disk_size = 3600
      },
     "io1" = {
        amount   = 6,
        disk_size = 3600
      }
    }
    "u-12tb1.metal" = {
      "gp2" = {
        amount   = 4,
        disk_size = 3600
      },
     "io1" = {
        amount   = 4,
        disk_size = 3600
      }
    }
    "u-9tb1.metal" = {
      "gp2" = {
        amount   = 4,
        disk_size = 2700
      },
     "io1" = {
        amount   = 4,
        disk_size = 2700
      }
    }
    "u-6tb1.metal" = {
      "gp2" = {
        amount   = 4,
        disk_size = 1800
      },
     "io1" = {
        amount   = 4,
        disk_size = 1800
      }
    }
    "x1e.32xlarge" = {
      "gp2" = {
        amount   = 3,
        disk_size = 1600
      },
     "io1" = {
        amount   = 3,
        disk_size = 1600
      }
    }
    "x1.32xlarge" = {
      "gp2" = {
        amount   = 3,
        disk_size = 800
      },
     "io1" = {
        amount   = 3,
        disk_size = 800
      }
    }
    "x1.16xlarge" = {
      "gp2" = {
        amount   = 3,
        disk_size = 400
      },
     "io1" = {
        amount   = 1,
        disk_size = 1200
      }
    }
    "r5.metal" = {
      "gp2" = {
        amount   = 3,
        disk_size = 400
      },
     "io1" = {
        amount   = 1,
        disk_size = 1200
      }
    }
    "r5.24xlarge" = {
      "gp2" = {
        amount   = 3,
        disk_size = 400
      },
     "io1" = {
        amount   = 1,
        disk_size = 1200
      }
    }
    "r5.16xlarge" = {
      "gp2" = {
        amount   = 3,
        disk_size = 225
      },
     "io1" = {
        amount   = 1,
        disk_size = 600
      }
    }
    "r4.16xlarge" = {
      "gp2" = {
        amount   = 3,
        disk_size = 225
      },
     "io1" = {
        amount   = 1,
        disk_size = 600
      }
    }
    "r5.12xlarge" = {
      "gp2" = {
        amount   = 3,
        disk_size = 225
      },
     "io1" = {
        amount   = 1,
        disk_size = 600
      }
    }
    "r5.8xlarge" = {
      "gp2" = {
        amount   = 3,
        disk_size = 225
      },
     "io1" = {
        amount   = 1,
        disk_size = 300
      }
    }
    "r4.8xlarge" = {
      "gp2" = {
        amount   = 3,
        disk_size = 225
      },
     "io1" = {
        amount   = 1,
        disk_size = 300
      }
    }
    "r3.8xlarge" = {
      "gp2" = {
        amount   = 3,
        disk_size = 225
      },
     "io1" = {
        amount   = 1,
        disk_size = 300
      }
    }
    "x1e.4xlarge" = {
      "gp2" = {
        amount   = 3,
        disk_size = 225
      },
     "io1" = {
        amount   = 1,
        disk_size = 600
      }
    }
    "x1e.2xlarge" = {
      "gp2" = {
        amount   = 3,
        disk_size = 225
      },
     "io1" = {
        amount   = 1,
        disk_size = 300
      }
    }
    "x1e.xlarge" = {
      "gp2" = {
        amount   = 3,
        disk_size = 225
      },
     "io1" = {
        amount   = 1,
        disk_size = 300
      }
    }
    "r5.4xlarge" = {
      "gp2" = {
        amount   = 3,
        disk_size = 225
      },
     "io1" = {
        amount   = 1,
        disk_size = 300
      }
    }
    "r5.2xlarge" = {
      "gp2" = {
        amount   = 3,
        disk_size = 225
      },
     "io1" = {
        amount   = 1,
        disk_size = 300
      }
    }
    "r4.4xlarge" = {
      "gp2" = {
        amount   = 3,
        disk_size = 225
      },
     "io1" = {
        amount   = 1,
        disk_size = 300
      }
    }
    "r3.4xlarge" = {
      "gp2" = {
        amount   = 3,
        disk_size = 225
      },
     "io1" = {
        amount   = 1,
        disk_size = 300
      }
    }
    "r4.2xlarge" = {
      "gp2" = {
        amount   = 3,
        disk_size = 225
      },
     "io1" = {
        amount   = 1,
        disk_size = 300
      }
    }
    "r3.2xlarge" = {
      "gp2" = {
        amount   = 3,
        disk_size = 225
      },
      "io1" = {
        amount   = 1,
        disk_size = 300
      }
    }
  }
  #type map(map(object({ amount = number, disk_size = number })))
  hana_log  = {
    "u-24tb1.metal" = {
      "gp2" = {
        amount   = 2,
        disk_size = 300
      },
     "io1" = {
        amount   = 1,
        disk_size = 525
      }
    },
    "u-18tb1.metal" = {
      "gp2" = {
        amount   = 2,
        disk_size = 300
      },
     "io1" = {
        amount   = 1,
        disk_size = 525
      }
    },
    "u-12tb1.metal" = {
      "gp2" = {
        amount   = 2,
        disk_size = 300
      },
     "io1" = {
        amount   = 1,
        disk_size = 525
      }
    },
    "u-9tb1.metal" = {
      "gp2" = {
        amount   = 2,
        disk_size = 300
      },
     "io1" = {
        amount   = 1,
        disk_size = 525
      }
    },
    "u-6tb1.metal" = {
      "gp2" = {
        amount   = 2,
        disk_size = 300
      },
     "io1" = {
        amount   = 1,
        disk_size = 525
      }
    },
    "x1e.32xlarge" = {
      "gp2" = {
        amount   = 2,
        disk_size = 300
      },
     "io1" = {
        amount   = 1,
        disk_size = 525
      }
    },
    "x1.32xlarge" = {
      "gp2" = {
        amount   = 2,
        disk_size = 300
      },
     "io1" = {
        amount   = 1,
        disk_size = 525
      }
    },
    "x1.16xlarge" = {
      "gp2" = {
        amount   = 2,
        disk_size = 300
      },
     "io1" = {
        amount   = 1,
        disk_size = 525
      }
    },
    "r5.metal" = {
      "gp2" = {
        amount   = 2,
        disk_size = 300
      },
     "io1" = {
        amount   = 1,
        disk_size = 525
      }
    },
    "r5.24xlarge" = {
      "gp2" = {
        amount   = 2,
        disk_size = 300
      },
     "io1" = {
        amount   = 1,
        disk_size = 525
      }
    },
    "r5.16xlarge" = {
      "gp2" = {
        amount   = 2,
        disk_size = 300
      },
     "io1" = {
        amount   = 1,
        disk_size = 260
      }
    },
    "r4.16xlarge" = {
      "gp2" = {
        amount   = 2,
        disk_size = 300
      },
     "io1" = {
        amount   = 1,
        disk_size = 260
      }
    },
    "r5.12xlarge" = {
      "gp2" = {
        amount   = 2,
        disk_size = 300
      },
     "io1" = {
        amount   = 1,
        disk_size = 260
      }
    },
    "r5.8xlarge" = {
      "gp2" = {
        amount   = 2,
        disk_size = 300
      },
     "io1" = {
        amount   = 1,
        disk_size = 260
      }
    },
    "r4.8xlarge" = {
      "gp2" = {
        amount   = 2,
        disk_size = 300
      },
     "io1" = {
        amount   = 1,
        disk_size = 260
      }
    },
    "r3.8xlarge" = {
      "gp2" = {
        amount   = 2,
        disk_size = 300
      },
     "io1" = {
        amount   = 1,
        disk_size = 260
      }
    },
    "x1e.4xlarge" = {
      "gp2" = {
        amount   = 2,
        disk_size = 175
      },
     "io1" = {
        amount   = 1,
        disk_size = 260
      }
    },
    "x1e.2xlarge" = {
      "gp2" = {
        amount   = 2,
        disk_size = 175
      },
     "io1" = {
        amount   = 1,
        disk_size = 260
      }
    },
    "x1e.xlarge" = {
      "gp2" = {
        amount   = 2,
        disk_size = 175
      },
     "io1" = {
        amount   = 1,
        disk_size = 260
      }
    },
    "r5.4xlarge" = {
      "gp2" = {
        amount   = 2,
        disk_size = 175
      },
     "io1" = {
        amount   = 1,
        disk_size = 260
      }
    },
    "r5.2xlarge" = {
      "gp2" = {
        amount   = 2,
        disk_size = 175
      },
     "io1" = {
        amount   = 1,
        disk_size = 260
      }
    },
    "r4.4xlarge" = {
      "gp2" = {
        amount   = 2,
        disk_size = 175
      },
     "io1" = {
        amount   = 1,
        disk_size = 260
      }
    },
    "r3.4xlarge" = {
      "gp2" = {
        amount   = 2,
        disk_size = 175
      },
     "io1" = {
        amount   = 1,
        disk_size = 260
      }
    },
    "r4.2xlarge" = {
      "gp2" = {
        amount   = 2,
        disk_size = 175
      },
     "io1" = {
        amount   = 1,
        disk_size = 260
      }
    },
    "r3.2xlarge" = {
      "gp2" = {
        amount   = 2,
        disk_size = 175
      },
     "io1" = {
        amount   = 1,
        disk_size = 260
      }
    }
  }
}