<?php
require_once __DIR__ . '/../../includes/auth_admin.php';
require_once __DIR__ . '/../../config/dbconfig.php';

$adminId = $_SESSION['user_id'];

// Total Student Count
$sqlStudentCount = "
  SELECT COUNT(*) AS total_students
  FROM users_assigned
  WHERE admin_id = :admin_id AND is_active = 1
";
$stmtStudentCount = $pdo->prepare($sqlStudentCount);
$stmtStudentCount->execute(['admin_id' => $adminId]);
$totalStudentCount = $stmtStudentCount->fetchColumn();

// Get all assigned_ids for this admin
$sqlAssignedIds = "
  SELECT assigned_id
  FROM users_assigned
  WHERE admin_id = :admin_id
";
$stmtAssignedIds = $pdo->prepare($sqlAssignedIds);
$stmtAssignedIds->execute(['admin_id' => $adminId]);
$assignedIds = $stmtAssignedIds->fetchAll(PDO::FETCH_COLUMN);

// Initialize counts
$approvedCount = $rejectedCount = $pendingCount = 0;

if (!empty($assignedIds)) {
  $placeholders = implode(',', array_fill(0, count($assignedIds), '?'));

  // Approved
  $sqlApproved = "
    SELECT COUNT(*) FROM duty_requests
    WHERE status = 'approved' AND assigned_id IN ($placeholders)
  ";
  $stmtApproved = $pdo->prepare($sqlApproved);
  $stmtApproved->execute($assignedIds);
  $approvedCount = $stmtApproved->fetchColumn();

  // Rejected
  $sqlRejected = "
    SELECT COUNT(*) FROM duty_requests
    WHERE status = 'rejected' AND assigned_id IN ($placeholders)
  ";
  $stmtRejected = $pdo->prepare($sqlRejected);
  $stmtRejected->execute($assignedIds);
  $rejectedCount = $stmtRejected->fetchColumn();

  // Pending
  $sqlPending = "
    SELECT COUNT(*) FROM duty_requests
    WHERE status = 'pending' AND assigned_id IN ($placeholders)
  ";
  $stmtPending = $pdo->prepare($sqlPending);
  $stmtPending->execute($assignedIds);
  $pendingCount = $stmtPending->fetchColumn();
}
?>

<!DOCTYPE html>
<html lang="en">

<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <link rel="icon" type="image/x-icon" href="/assets/img/favicon.ico">
  <script src="https://cdn.tailwindcss.com"></script>
  <title>Admin Dashboard</title>
</head>

<body class="bg-gray-100">
  <div class="flex h-screen">

    <div class="w-64 bg-white shadow-md flex flex-col justify-between">
      <div>
        <div class="text-center py-5 border-b">
          <h2 class="text-lg font-bold">
            <?php echo htmlspecialchars($logged_in_admin); ?>
          </h2>
        </div>

        <nav class="p-4 space-y-2">
          <a href="dashboard.php"
            class="block px-4 py-2 bg-gray-200 rounded-lg font-medium hover:bg-gray-300">Dashboard</a>
          <a href="duty_approval.php" class="block px-4 py-2 rounded-lg hover:bg-gray-200">Duty Approval</a>
          <a href="duty_history.php" class="block px-4 py-2 rounded-lg hover:bg-gray-200">History</a>
          <a href="student_list.php" class="block px-4 py-2 rounded-lg hover:bg-gray-200">Student List</a>
        </nav>
      </div>
      <form action="/pages/auth/logout.php" method="POST" class="p-4">
        <button type="submit" class="w-full bg-red-600 hover:bg-red-700 text-white py-2 rounded-lg">Log Out</button>
      </form>
    </div>

    <div class="flex-1 p-8 overflow-y-auto">
      <div class="grid grid-cols-1 md:grid-cols-4 gap-6 mb-10">
        <div class="bg-white p-6 rounded-xl shadow-sm border-l-4 border-purple-500">
          <h3 class="text-gray-500 text-sm font-semibold">Active Student Count</h3>
          <p class="text-3xl font-bold mt-2 text-purple-600">
            <?php echo $totalStudentCount; ?>
          </p>
        </div>

        <div class="bg-white p-6 rounded-xl shadow-sm border-l-4 border-red-500">
          <h3 class="text-gray-500 text-sm font-semibold">Rejected Duty Logs</h3>
          <p class="text-3xl font-bold mt-2 text-red-600">
            <?php echo $rejectedCount; ?>
          </p>
        </div>

        <div class="bg-white p-6 rounded-xl shadow-sm border-l-4 border-yellow-500">
          <h3 class="text-gray-500 text-sm font-semibold">Pending Duty Logs</h3>
          <p class="text-3xl font-bold mt-2 text-yellow-600">
            <?php echo $pendingCount; ?>
          </p>
        </div>

        <div class="bg-white p-6 rounded-xl shadow-sm border-l-4 border-green-500">
          <h3 class="text-gray-500 text-sm font-semibold">Completed Duty Logs</h3>
          <p class="text-3xl font-bold mt-2 text-green-600">
            <?php echo $approvedCount; ?>
          </p>
        </div>
      </div>
    </div>
</body>

</html>