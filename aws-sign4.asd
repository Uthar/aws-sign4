;;;;  aws-sign4
;;;;
;;;;  Copyright (C) 2013 Thomas Bakketun <thomas.bakketun@copyleft.no>
;;;;
;;;;  This library is free software: you can redistribute it and/or modify
;;;;  it under the terms of the GNU Lesser General Public License as published
;;;;  by the Free Software Foundation, either version 3 of the License, or
;;;;  (at your option) any later version.
;;;;
;;;;  This library is distributed in the hope that it will be useful,
;;;;  but WITHOUT ANY WARRANTY; without even the implied warranty of
;;;;  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
;;;;  GNU General Public License for more details.
;;;;
;;;;  You should have received a copy of the GNU General Public License
;;;;  along with this library.  If not, see <http://www.gnu.org/licenses/>.

(defsystem #:aws-sign4
  :name "aws-sign4"
  :licence "GNU Lesser General Public Licence 3.0"
  :author "Thomas Bakketun <thomas.bakketun@copyleft.no>"
  :description "A library for Amazon Web Services signing version 4"
  :depends-on (:local-time
               :cl-ppcre
               :ironclad
               :split-sequence
               :flexi-streams
               :secret-values)
  :serial t
  :components ((:file "package")
               (:file "aws-sign4"))
  :in-order-to ((test-op (test-op #:aws-sign4/tests))))

(defsystem #:aws-sign4/example
  :name "aws-sign4/example"
  :licence "Example"
  :depends-on (:aws-sign4 :drakma)
  :components ((:module example
                        :serial t
                        :components ((:file "package")
                                     (:file "example")))))

(defsystem #:aws-sign4/tests
  :name "aws-sign4/tests"
  :licence "GNU Lesser General Public Licence 3.0"
  :author "Thomas Bakketun <thomas.bakketun@copyleft.no>"
  :description "Tests for aws-sign4"
  :depends-on (:aws-sign4)
  :components ((:module tests
                        :serial t
                        :components ((:file "package")
                                     (:file "test"))))
  :perform (test-op (op c) 
             (uiop:symbol-call :aws-sign4-tests :run-tests)))

