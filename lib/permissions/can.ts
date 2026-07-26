import type { Permission } from "./permissions";

export function can(
  userPermissions: Permission[],
  permission: Permission,
) {
  return userPermissions.includes(permission);
}
