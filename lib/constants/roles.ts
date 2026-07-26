export const ROLES = {
  SUPER_ADMIN: "super_admin",
  OWNER: "owner",
  MANAGER: "manager",
  STAFF: "staff",
} as const;

export type Role =
  (typeof ROLES)[keyof typeof ROLES];
